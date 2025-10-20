# Ansible Role Users

[![Ansible-lint](https://github.com/cod3mas0n/ansible-role-users/actions/workflows/ansible-lint.yml/badge.svg)](https://github.com/cod3mas0n/ansible-role-users/actions/workflows/ansible-lint.yml)
[![Yamllint](https://github.com/cod3mas0n/ansible-role-users/actions/workflows/yamllint.yml/badge.svg)](https://github.com/cod3mas0n/ansible-role-users/actions/workflows/yamllint.yml)
[![Flake8](https://github.com/cod3mas0n/ansible-role-users/actions/workflows/flake8.yml/badge.svg)](https://github.com/cod3mas0n/ansible-role-users/actions/workflows/flake8.yml)
[![Release](https://github.com/cod3mas0n/ansible-role-users/actions/workflows/release.yml/badge.svg)](https://github.com/cod3mas0n/ansible-role-users/actions/workflows/release.yml)

Ansible role for managing users and groups on Linux hosts.

## Requirements (Work With Make)

- install requirements

  ```bash
  pip3 install -r requirements.txt
  ```

- [community.posix](https://galaxy.ansible.com/ui/repo/published/ansible/posix/) ansible collection
- install `ansible collection` requirements

  ```bash
  ansible-galaxy install -r requirements.yml
  ```

## Role Variables

### users_groups

Create and manage user groups on target hosts.

When a group is removed from this variable, the associated group on the hosts will be deleted.

Each entry in the users_groups list can contain the following keys:

- `name`: The name of the group to create or manage. **Required**.
- `gid`: The group ID number. If not specified, the system assigns the next available GID.
- `system`: Specifies whether the group is a system group. Default: `false`.
- `local`: Forces the use of "local" command alternatives on platforms that implement it. Default: `false`
- `state`: state of group, "present" group creation, "absent" group deletion. . Default: `present`

### users_users

Create and manage users on target hosts.

When a user is removed from this variable, the associated user on the hosts will be deleted.

Each entry in the users_users list can contain the following keys:

**Note**:
> When adding a user to an additional group or granting `sudo` privileges, ensure that the `append` option is set to `true` (which is the default). If you do not want to append the user to additional group or assign `sudo` rights, set append to `false`.</br>
> Using append: `false` will remove the user from all other groups, which might lead to loss of necessary permissions or access. Ensure this is the intended behavior before applying.

- `name`: The username of the account to create or manage. **Required**.
- `password`: The encrypted user password.
- `update_password`: Specifies when to update the password. Can be `always` or `on_create`.
- `shell`: The user's login shell. Default: `/bin/bash`.
- `uid`: The user ID number. If not specified, the system assigns the next available UID.
- `comment`: The GECOS field.
- `home`: Path to the user's home directory.
- `create_home`: Create the home directory if it doesn't exist.
- `expires`: Account expiration date in epoch. Can be removed by specifying a `-1`.
- `group`: User's primary group name.
- `groups`: List of additional groups the user belongs to.
- `sudoer`: Make user sudoer. Default: `false`.
- `append`: Whether to append to the groups list or replace it. Default: `false`.
- `non_unique`: Allow duplicate UIDs. Default: `false`.
- `system`: Create a system account. Default: `false`.
- `local`: Forces the use of "local" command alternatives on platforms that implement it. Default: `false`.
- `state`: state of user, "present" user creation, "absent" user deletion. . Default: `present`
- `ssh_key`: SSH public key to add to authorized_keys. Can be multiline.
- `ssh_key_options`: SSH options for the key.
- `ssh_comment`: A comment for the SSH key.
- `ssh_exclusive`: Remove all other keys from the authorized_keys file.

### users_remove_home

Defines whether the home directory will be deleted when the user is deleted. Default: `false`.

### users_remove_force_user

Forced deletion of a user, associated directories and groups. Default: `false`.

### users_remove_force_group

Forced deletion of a group. Default: `false`.

## Compatibility

## License

Licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

## Author

Ali Mehraji \
a.mehraji75@gmail.com
