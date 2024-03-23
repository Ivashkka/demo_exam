import yaml, os, copy, ipaddress

config_dir          =   "config/"
localization        =   'ru'

deploy_options      =   {}
filemap_options     =   {}

approved_groups     =   []
replace_list        =   []


def find_mask_by_ip_marker_name(ip_marker_name : str):
    if 'IP4' in ip_marker_name:
        ip_mask_name = ip_marker_name.replace('IP4', 'MASK4')
    elif 'IP6' in ip_marker_name:
        ip_mask_name = ip_marker_name.replace('IP6', 'MASK6')
    else:
        raise Exception(f'wrong marker name {ip_marker_name}')
    for group in approved_groups:
        for member in group['members']:
            if member['name'] == ip_mask_name:
                return int(member['value'])
    else:
        raise Exception(f"failed to find mask for {ip_marker_name}")


def find_ip_by_mask_marker_name(mask_marker_name : str):
    if 'MASK4' in mask_marker_name:
        mask_marker_name = mask_marker_name.replace('MASK4', 'IP4')
    elif 'MASK6' in mask_marker_name:
        mask_marker_name = mask_marker_name.replace('MASK6', 'IP6')
    else:
        raise Exception(f'wrong marker name {mask_marker_name}')
    for group in approved_groups:
        for member in group['members']:
            if member['name'] == mask_marker_name:
                return member['value']
    else:
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
    if ':' in ip: raise Exception("ipv6 address in get_fullmask4_action")
    net = ipaddress.IPv4Network(str(ip)+'/'+str(mask), strict=False)
    return str(net.netmask)

def check_if_marker_in_task(marker : dict, task : int):
    for t in filemap_options['tasklist']:
        if 'add' in list(t.keys()) and 'markers' in list(t['add'].keys()):
            if marker['name'] in t['add']['markers']:
                if t['index'] > task: return False
        # if 'redefine' in list(t.keys()) and 'markers' in list(t['redefine'].keys()):
        #     for pair in t['redefine']['markers']:
        #         if marker['name'] == pair.split(' ')[0]:
        #             if t['index'] <= task: return False
    return True

def check_if_group_in_task(group : dict, task : int):
    for t in filemap_options['tasklist']:
        if 'add' in list(t.keys()) and 'groups' in list(t['add'].keys()):
            if group['name'] in t['add']['groups']:
                if t['index'] > task: return False
    return True


def load_host_data(hostname : str):
    global deploy_options, filemap_options
    try:
        with open(os.path.join(config_dir, 'options.yaml'), 'r', encoding='utf-8') as f:
            deploy_options = yaml.safe_load(f)['deploy']
        with open(os.path.join(config_dir, f'{hostname.upper()}-filemap.yaml'), 'r', encoding='utf-8') as f:
            filemap_options = yaml.safe_load(f)['filemap']
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


def get_new_or_keep_old(marker : dict, rjust_size : int):
    while True:
        answer = input(f'\033[91m{marker['name'].rjust(rjust_size)}$\033[0m  {marker[f'{localization}-desc']} (default - {marker['value']}): ')
        data = answer if answer != '' else marker['value']
        question = f'будет присвоено значение - {data} (y/n): ' if localization == 'ru' else f'setting - {data} (y/n): '
        while True:
            approve = input(' '*(rjust_size+3)+question)
            if approve == 'y' or approve == 'n' or approve == '': break
        if approve != 'n': break
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
            match list(i.keys())[0]:
                case 'append':
                    #new_marker = copy.deepcopy(member)
                    new_marker = {'name':member['name']}
                    new_marker['name'] += i['append']
                case 'replace':
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
            if len(variable) != 2: raise Exception(f"can't find variable {variable}")
            if variable[0] == 'GENERIC-MEMBER':
                if generic_member_name == '': raise Exception("GENERIC-MEMBER is empty!")
                variable[0] = generic_member_name
            for group in approved_groups:
                for member in group['members']:
                    if member['name'] == variable[0]:
                        variable[1] = member[variable[1]]
                        break
            match len(action):
                case 0:
                    variable = variable[1]
                case 1:
                    variable = globals()[action[0]+'_action'](*variable)
                case _:
                    variable = globals()[action[0]+'_action'](*variable, *action[1:])
            marker[key] = marker[key].replace(word, variable)



def main():
    global approved_groups
    hostname = 'HQ-R'
    task = 1.2
    if load_host_data(hostname) != True:
        raise Exception("failed to read configuration files")
    max_mark_name = get_max_marker_name_len()
    for group in filemap_options['markers']['groups']:
        new_group = copy.deepcopy(group)
        new_group['members'] = []
        if not check_if_group_in_task(group, task): continue
        if 'noask' not in list(group.keys()) or group['noask'] == False:
            print(f'\033[93m{group[f'{localization}-desc'].upper()}\033[0m')
        else:
            pass
        if 'members' in list(group.keys()):
            for member in group['members']:
                if not check_if_marker_in_task(member, task): continue
                fill_variables(member)
                if 'noask' not in list(member.keys()) or member['noask'] == False:
                    new_group['members'].append(get_new_or_keep_old(member, max_mark_name))
                else:
                    #print(f'hidden marker {member['name']} value - {member['value']}')
                    new_group['members'].append(member)
        if 'generic' in list(group.keys()):
            new_group.pop('generic')
            if not check_if_generic_target_exists(group): raise Exception("may be wrong sequence of groups in filemap! no generic target")
            new_markers = generic_markers_list(group['generic'])
            for member in new_markers:
                if not check_if_marker_in_task(member, task): continue
                if 'noask' not in list(member.keys()) or member['noask'] == False:
                    new_group['members'].append(get_new_or_keep_old(member, max_mark_name))
                else:
                    #print(f'hidden marker {member['name']} value - {member['value']}')
                    new_group['members'].append(member)
        approved_groups.append(new_group)
        print('')

if __name__ == '__main__':
    main()
