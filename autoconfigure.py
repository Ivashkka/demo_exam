import yaml, os, copy, ipaddress, subprocess, platform, time

config_dir          =   "config/"
localization        =   None
hostname = None
task = 0

deploy_options      =   {}
filemap_options     =   {}

approved_groups     =   []
replace_dict        =   {}


def print_with_localization(en_desc, ru_desc, endl = '\n', color=''):
    say = en_desc if localization == 'en' else ru_desc
    print(color+say+"\033[0m", end=endl)


def find_mask_by_ip_marker_name(ip_marker_name : str):
    if 'IP4' in ip_marker_name:
        ip_mask_name = ip_marker_name.replace('IP4', 'MASK4')
    elif 'IP6' in ip_marker_name:
        ip_mask_name = ip_marker_name.replace('IP6', 'MASK6')
    else:
        print('\033[91merror\033[0m tell Ivan Rakov about it')
        raise Exception(f'wrong marker name {ip_marker_name}')
    for group in approved_groups:
        for member in group['members']:
            if member['name'] == ip_mask_name:
                return int(member['value'])
    else:
        print('\033[91merror\033[0m tell Ivan Rakov about it')
        raise Exception(f"failed to find mask for {ip_marker_name}")


def find_ip_by_mask_marker_name(mask_marker_name : str):
    if 'MASK4' in mask_marker_name:
        mask_marker_name = mask_marker_name.replace('MASK4', 'IP4')
    elif 'MASK6' in mask_marker_name:
        mask_marker_name = mask_marker_name.replace('MASK6', 'IP6')
    else:
        print('\033[91merror\033[0m tell Ivan Rakov about it')
        raise Exception(f'wrong marker name {mask_marker_name}')
    for group in approved_groups:
        for member in group['members']:
            if member['name'] == mask_marker_name:
                return member['value']
    else:
        print('\033[91merror\033[0m tell Ivan Rakov about it')
        raise Exception(f"failed to find ip for {mask_marker_name}")


def get_addr_action(marker_name : str, src_ip : str, tgt_host):
    mask = find_mask_by_ip_marker_name(marker_name)
    tgt_host = int(tgt_host)
    if '.' in src_ip:
        ip = ipaddress.IPv4Network(src_ip+'/'+str(mask), strict=False)
    elif ':' in src_ip:
        ip = ipaddress.IPv6Network(src_ip+'/'+str(mask), strict=False)
    return str(ip.network_address + tgt_host)

def get_first_addr_action(marker_name : str, src_ip : str):
    return get_addr_action(marker_name, src_ip, 1)

def get_zero_addr_action(marker_name : str, src_ip : str):
    return get_addr_action(marker_name, src_ip, 0)

def get_next_addr_action(marker_name : str, src_ip : str):
    if '.' in src_ip:
        ip = ipaddress.IPv4Address(src_ip)
    elif ':' in src_ip:
        ip = ipaddress.IPv6Address(src_ip)
    return str(ip + 1)

def get_fullmask4_action(marker_name : str, mask):
    ip = find_ip_by_mask_marker_name(marker_name)
    if ':' in ip:
        print('\033[91merror\033[0m tell Ivan Rakov about it')
        raise Exception("ipv6 address in get_fullmask4_action")
    net = ipaddress.IPv4Network(str(ip)+'/'+str(mask), strict=False)
    return str(net.netmask)

def check_if_marker_in_task(marker : dict):
    if 'tasklist' not in list(filemap_options.keys()): return True
    for t in filemap_options['tasklist']:
        if 'add' in list(t.keys()) and 'markers' in list(t['add'].keys()):
            if marker['name'] in t['add']['markers']:
                if t['index'] > task: return False
        # if 'redefine' in list(t.keys()) and 'markers' in list(t['redefine'].keys()):
        #     for pair in t['redefine']['markers']:
        #         if marker['name'] == pair.split(' ')[0]:
        #             if t['index'] <= task: return False
    return True

def check_if_group_in_task(group : dict):
    if 'tasklist' not in list(filemap_options.keys()): return True
    for t in filemap_options['tasklist']:
        if 'add' in list(t.keys()) and 'groups' in list(t['add'].keys()):
            if group['name'] in t['add']['groups']:
                if t['index'] > task: return False
    return True


def load_host_data():
    global deploy_options, filemap_options, localization, hostname
    try:
        hostname = platform.node().upper()
        print(f"\n\nloading configs for {hostname}".upper())
        with open(os.path.join(config_dir, 'options.yaml'), 'r', encoding='utf-8') as f:
            deploy_options = yaml.safe_load(f)['deploy']
        with open(os.path.join(config_dir, f'{hostname.upper()}-filemap.yaml'), 'r', encoding='utf-8') as f:
            filemap_options = yaml.safe_load(f)['filemap']
        with open(os.path.join(config_dir, 'language'), 'r', encoding='utf-8') as f:
            localization = f.read()[:2]
        return True
    except Exception as e:
        print(e)
        return False

def get_max_marker_name_len():
    maxlen = 0
    maxpref = 0
    maxpost = 0
    prefixgroups = []
    for group in filemap_options['markers']['groups']:
        if 'generic' not in list(group.keys()): continue
        prefixgroups.append(group['generic']['src-group'])
    for group in filemap_options['markers']['groups']:
        if 'generic' in list(group.keys()): continue
        for mark in group['members']:
            if group['name'] in prefixgroups:
                if len(mark['name']) > maxpref: maxpref = len(mark['name'])
            else:
                if len(mark['name']) > maxlen: maxlen = len(mark['name'])
    for group in filemap_options['markers']['groups']:
        if 'generic' not in list(group.keys()): continue
        for mark in group['generic']['iterate']:
            if 'append' in list(mark.keys()):
                if len(mark['append']) + maxpref > maxpref: maxpost = len(mark['append'])
    return max(maxpref + maxpost, maxlen)


def ask_for_new(motd : str, default, rjust_size : int = 0):
    while True:
        resp = input(motd)
        data = resp if resp != '' else default
        question = f'будет присвоено значение - {data} (y/n): ' if localization == 'ru' else f'setting - {data} (y/n): '
        while True:
            approve = input(' '*rjust_size+question)
            if approve == 'y' or approve == 'n' or approve == '': break
        if approve != 'n': break
    return data


def get_new_marker_or_keep_old(marker : dict, rjust_size : int):
    # while True:
    #     answer = input(f'\033[91m{marker['name'].rjust(rjust_size)}$\033[0m  {marker[f'{localization}-desc']} (default - {marker['value']}): ')
    #     data = answer if answer != '' else marker['value']
    #     question = f'будет присвоено значение - {data} (y/n): ' if localization == 'ru' else f'setting - {data} (y/n): '
    #     while True:
    #         approve = input(' '*(rjust_size+3)+question)
    #         if approve == 'y' or approve == 'n' or approve == '': break
    #     if approve != 'n': break
    
    data = ask_for_new(f"\033[91m{marker['name'].rjust(rjust_size)}$\033[0m  {marker[f'{localization}-desc']} (default - {marker['value']}): ", marker['value'], rjust_size+3)
    new_marker = copy.deepcopy(marker)
    new_marker['value'] = data
    return new_marker


def check_if_generic_target_exists(group : dict):
    for agroup in approved_groups:
        if group['generic']['src-group'] == agroup['name']: return True
    return False


def generic_markers_list(generic : dict):
    new_markers = []
    for group in approved_groups:
        if group['name'] == generic['src-group']:
            tgt_group = group
            break
    count = 0
    for member in tgt_group['members']:
        excluded = False
        if 'exclude' in list(generic.keys()):
            for ex in generic['exclude']:
                if ex in member['name']:
                    excluded = True
                    break
        if excluded: continue
        for i in generic['iterate']:
            if list(i.keys())[0] == 'append':
                #new_marker = copy.deepcopy(member)
                new_marker = {'name':member['name']}
                new_marker['name'] += i['append']
            elif list(i.keys())[0] == 'replace':
                pair = i['replace'].split(' ')
                if pair[0] not in member['name']: continue
                #new_marker = copy.deepcopy(member)
                new_marker = {'name':member['name']}
                new_marker['name'] = new_marker['name'].replace(pair[0], pair[1])
            if 'values' in list(i.keys()):
                new_marker['value'] = i['values'][count]
            elif 'value' in list(i.keys()):
                new_marker['value'] = i['value']
            if 'ru-desc' in list(i.keys()):
                new_marker['ru-desc'] = i['ru-desc']
            if 'en-desc' in list(i.keys()):
                new_marker['en-desc'] = i['en-desc']
            if 'noask' in list(i.keys()):
                new_marker['noask'] = i['noask']
            fill_variables(new_marker, member['name'])
            new_markers.append(new_marker)
        count += 1
    return new_markers


def split_command(field : str):
    words = field.split(' ')
    for word in words:
        if '$' in word:
            command = word[1:]
            break
    if '|' in command:
        raw_split = command.split('|')
        variable = raw_split[0].split('$')
        action = raw_split[1:]
    else:
        variable = command.split('$')
        action = []
    return variable, action, word


def fill_variables(marker : dict, generic_member_name : str = ''):
    for key in list(marker.keys()):
        if '$' in str(marker[key]):
            variable, action, word = split_command(marker[key])
            if len(variable) != 2:
                print('\033[91merror\033[0m tell Ivan Rakov about it')
                raise Exception(f"can't find variable {variable}")
            if variable[0] == 'GENERIC-MEMBER':
                if generic_member_name == '':
                    print('\033[91merror\033[0m tell Ivan Rakov about it')
                    raise Exception("GENERIC-MEMBER is empty!")
                variable[0] = generic_member_name
            for group in approved_groups:
                for member in group['members']:
                    if member['name'] == variable[0]:
                        variable[1] = member[variable[1]]
                        break
            if len(action) == 0:
                variable = variable[1]
            elif len(action) == 1:
                variable = globals()[action[0]+'_action'](*variable)
            else:
                variable = globals()[action[0]+'_action'](*variable, *action[1:])
            marker[key] = marker[key].replace(word, variable)


def create_users(indetail : bool = False):
    maxcode = 0
    for user in deploy_options['users']:
        if user['task'] <= task: break
    else: return
    while True:
        if not indetail:
            resp = 'y'
            break
        print_with_localization(f"create users for task {task}? (y/n)", f"создать пользователей для задания {task}? (y/n)", endl='')
        resp = input()
        if resp == 'n' or resp == 'y' or resp == '':
            break
    if resp == 'n': return
    for user in deploy_options['users']:
        if user['task'] > task: continue
        if hostname in user['hosts'] or user['hosts'] == 'ALL':
            code = subprocess.call(f"sudo useradd {user['name']} -m -U".split())
            if code > maxcode: maxcode = code
            #print(f"sudo useradd {user['name']} -m -U".split())
            if localization == 'en':
                new_pass = ask_for_new(f"password for {user['name']} (default is {user['password']}): ", user['password'])
            elif localization == 'ru':
                new_pass = ask_for_new(f"пароль для пользователя {user['name']} (default is {user['password']}): ", user['password'])
            code = subprocess.call(f"echo {user['name']}:{new_pass} | chpasswd".split())
            if code > maxcode: maxcode = code
            #print(f"echo {user['name']}:{new_pass} | chpasswd".split())
    if maxcode != 0:
        print("\033[93mwarn\033[0m: " + f"some commands reterned {maxcode}")
    if indetail: print_with_localization("done", "готово")


def install_packages(indetail : bool = False):
    for pckg in deploy_options['packages']:
        if pckg['task'] <= task: break
    else: return
    while True:
        if not indetail:
            resp = 'y'
            break
        print_with_localization(f"install packages for task {task}? (y/n)", f"установить пакеты для задания {task}? (y/n)", endl='')
        resp = input()
        if resp == 'n' or resp == 'y' or resp == '':
            break
    if resp == 'n': return
    pckgs = []
    for pckg in deploy_options['packages']:
        if pckg['task'] > task: continue
        if hostname in pckg['hosts'] or pckg['hosts'] == 'ALL':
            pckgs.append(pckg['name'])
    code = subprocess.call(("apt-get install "+' '.join(pckgs)).split())
    if code != 0:
        print("\033[93mwarn\033[0m: " + f"some commands reterned {code}")
    if indetail: print_with_localization("done", "готово")


def enable_units(indetail : bool = False):
    for pckg in deploy_options['packages']:
        if pckg['task'] <= task: break
    else: return
    while True:
        if not indetail:
            resp = 'y'
            break
        print_with_localization(f"enable all new services in systemd? (y/n)", f"включить запуск всех установленных сервисов в systemd? (y/n)", endl='')
        resp = input()
        if resp == 'n' or resp == 'y' or resp == '':
            break
    if resp == 'n': return
    units = []
    for pckg in deploy_options['packages']:
        if pckg['task'] > task: continue
        if hostname in pckg['hosts'] or pckg['hosts'] == 'ALL':
            units.extend(pckg['units'])
    code = subprocess.call(("systemctl enable "+' '.join(units)).split())
    if code != 0:
        print("\033[93mwarn\033[0m: " + f"some commands reterned {code}")
    if indetail: print_with_localization("done", "готово")


def approve_groups(indetail : bool = False):
    global approved_groups
    max_mark_name = get_max_marker_name_len()
    for group in filemap_options['markers']['groups']:
        new_group = copy.deepcopy(group)
        new_group['members'] = []
        if not check_if_group_in_task(group): continue
        if 'noask' not in list(group.keys()) or group['noask'] == False:
            if indetail: print(f"\033[93m{group[f'{localization}-desc'].upper()}\033[0m")
        if 'members' in list(group.keys()):
            for member in group['members']:
                if not check_if_marker_in_task(member): continue
                fill_variables(member)
                if ('noask' not in list(member.keys()) or member['noask'] == False) and indetail:
                    new_group['members'].append(get_new_marker_or_keep_old(member, max_mark_name))
                else:
                    #print(f'hidden marker {member['name']} value - {member['value']}')
                    new_group['members'].append(member)
        if 'generic' in list(group.keys()):
            new_group.pop('generic')
            if not check_if_generic_target_exists(group):
                print('\033[91merror\033[0m tell Ivan Rakov about it')
                raise Exception("may be wrong sequence of groups in filemap! no generic target")
            new_markers = generic_markers_list(group['generic'])
            for member in new_markers:
                if not check_if_marker_in_task(member): continue
                if ('noask' not in list(member.keys()) or member['noask'] == False) and indetail:
                    new_group['members'].append(get_new_marker_or_keep_old(member, max_mark_name))
                else:
                    #print(f'hidden marker {member['name']} value - {member['value']}')
                    new_group['members'].append(member)
        approved_groups.append(new_group)
        if indetail: print('')

def remove_file(path : str):
    try:
        if os.path.isfile(path):
            os.remove(path)
        elif os.path.isdir(path):
            for root, dirs, files in os.walk(path, topdown=False):
                for file in files:
                    file_path = os.path.join(root, file)
                    os.remove(file_path)
                for dir_name in dirs:
                    dir_path = os.path.join(root, dir_name)
                    os.rmdir(dir_path)
            os.rmdir(path)
    except Exception as e:
        print("\033[93mwarn remove_file\033[0m: " + str(e))

def rename_file(path : str, newpath : str):
    try:
        os.rename(path, newpath)
    except Exception as e:
        print("\033[93mwarn rename_file\033[0m: " + str(e))

def redefine_file(fpath2 : str, fpath1 : str):
    try:
        with open(fpath1, "r") as source:
            with open(fpath2, "w") as destination:
                for line in source:
                    destination.write(line)
    except Exception as e:
        print("\033[93mwarn redefine_file\033[0m: " + str(e))

def reword_files(dpath : str, indetail : bool = False):
    replaces = 0
    for root, dirs, files in os.walk(dpath):
        for mark in list(replace_dict.keys()):
            if mark in root:
                new_root = root.replace(mark, replace_dict[mark])
                rename_file(root, new_root)
                root = new_root
                replaces += 1
        for file_name in files:
            try:
                file_path = os.path.join(root, file_name)
                if indetail: print(file_path)
                with open(file_path, 'r') as f:
                    data = f.read()
                for mark in list(replace_dict.keys()):
                    if mark in file_name:
                        new_fn = file_name.replace(mark, replace_dict['mark'])
                        rename_file(file_path, os.path.join(root, new_fn))
                        file_path = os.path.join(root, new_fn)
                        replaces += 1
                    if mark in data:
                        data = data.replace(mark, replace_dict[mark])
                        replaces += 1
                with open(file_path, 'w') as f:
                    f.write(data)
            except Exception as e:
                print("\033[93mwarn reword_files\033[0m: " + str(e))
    if replaces < 5: print("\033[93mwarn reword_files\033[0m: " + "too fiew replaces. maybe corrupted tmp files or filemap")


def rewrite_tmp_files(indetail : bool = False):
    tmp_dir = hostname + '~'
    if not os.path.exists(tmp_dir):
        print('\033[91merror\033[0m tell Ivan Rakov about it')
        raise Exception(f"no tmp dir {hostname}~ !")
    print_with_localization("\nconfiguring tmp files".upper(), "\n"+"настройка временных конфигурационных файлов".upper(), color='\033[94m')
    if 'tasklist' in list(filemap_options.keys()):
        for t in filemap_options['tasklist']:
            if 'add' in list(t.keys()) and 'files' in list(t['add'].keys()):
                if t['index'] > task:
                    for f in t['add']['files']:
                        remove_file(os.path.join(tmp_dir, f))
            if 'redefine' in list(t.keys()) and 'files' in list(t['redefine'].keys()):
                for fp in t['redefine']['files']:
                    pair = fp.split(' ')
                    if t['index'] <= task:
                        redefine_file(os.path.join(tmp_dir, pair[0]), os.path.join(tmp_dir, pair[1]))
                    remove_file(os.path.join(tmp_dir, pair[1]))
    reword_files(tmp_dir, indetail)
    print_with_localization("done", "готово", color='\033[94m')


def sort_markers():
    global replace_dict
    for group in approved_groups:
        for member in group['members']:
            replace_dict[member['name']]=str(member['value'])
    replace_dict = dict(sorted(replace_dict.items(), key=lambda x: len(x[0]), reverse=True))


def check_if_host_valid():
    if hostname not in deploy_options['map']:
        print('\033[91merror\033[0m tell Ivan Rakov about it')
        raise Exception("host not in deploy hosts")



def print_vbox_net_map():
    print_with_localization(f"\nVirtualBox vm network configuration for {hostname}".upper(), f"\nVirtualBox конфигурация сети виртуальной машины {hostname}".upper())
    count = 1
    for connect in deploy_options['map'][hostname]:
        print_with_localization(f"adapter {count}", f"адаптер {count}", endl=': ', color='\033[92m')
        if connect != "~NAT": print_with_localization(f"Internal Network {hostname}-{connect}", f"Внутренняя сеть {hostname}-{connect}")
        else: print("NAT")
        count += 1
    print_with_localization("If you have changed configuration manually, this map may be wrong!", "Если вы изменяли конфигурацию вручную, то эта карта может быть неверной!", color='\033[93m')


def apply_configuration():
    subprocess.call(f"rsync -r --progress {hostname}~/ /".split())
    subprocess.call("systemctl daemon-reload".split())


def reboot_or_not(indetail : bool = False):
    resp = ''
    while True:
        if not indetail: break
        print_with_localization("\nreboot? (y/n)", '\n'+"перезагрузиться? (y/n)", endl=' ')
        print_with_localization("recommended - yes", "рекомендуется - yes", endl=': ', color='\033[91m')
        resp = input()
        if resp == '' or resp == 'y' or resp == 'n': break
    if resp != 'n':
        subprocess.call('reboot'.split())


def main():
    global task
    if load_host_data() != True:
        print('\033[91merror\033[0m tell Ivan Rakov about it')
        raise Exception("failed to read configuration files")
    check_if_host_valid()
    while True:
        print_with_localization("1 - fast setup | 2 - detailed setup", "1 - быстрая настройка | 2 - детальная настройка", endl=': ')
        indetail = input()
        if indetail == '1' or indetail == '2': break
    indetail = False if indetail == '1' else True
    while True:
        print_with_localization("enter task number (module.task for ex: 1.7)", "введите номер задания (модуль.задание например: 1.7)", endl=': ')
        resp = input()
        try:
            task = float(resp)
            break
        except: pass
    create_users(indetail)
    install_packages(indetail)
    approve_groups(indetail)
    sort_markers()
    rewrite_tmp_files(indetail)
    resp = ''
    while True:
        if not indetail: break
        print_with_localization("apply configuration to host?(irreversible) (y/n)", "применить конфигурацию к хосту?(необратимо) (y/n)", endl=': ', color='\033[92m')
        resp = input()
        if resp == '' or resp == 'y' or resp == 'n': break
    if resp != 'n':
        apply_configuration()
        print_vbox_net_map()
        reboot_or_not(indetail)


if __name__ == '__main__':
    main()
