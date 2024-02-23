Ansible role: Vector
=========

Деплой Vector, используя Ansible.

Requirements
------------

OC: `(CentOs, RHEL, Fedora) `

Dependencies
------------

Работает вместе с Clickhouse и Lighthouse.

Role Variables
--------------



| var | default | description  |
| ----------- | ----------- | ----------- |
| ansible_ssh_user:  | centos  | Пользователь, от которого выполняется playbook  |
| vector_version  | 0.35.0  | Версия Vector |
|  vector_install_dir               |  /opt/vector        |    Место установки Vector          |
| vector_config |  etc/vector/vector.toml| Директория с config файлом Vector

Example Playbook
----------------


    - hosts: vector
      roles: vector_role

License
-------

BSD
