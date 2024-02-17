Ansible role: lighthouse
=========

Деплой lighthouse, используя Ansible.

Requirements
------------

OC: `(CentOs, RHEL, Fedora) `

Dependencies
------------

Работает вместе с Clickhouse и Vector.
Требует Nginx, есть отдельная tasks для этого (` tasks/nginx.yml`)

Role Variables
--------------



| var | default | description  |
| ----------- | ----------- | ----------- |
| ansible_ssh_user:  | centos  | Пользователь, от которого выполняется playbook  |
| nginx.conf  | /etc/nginx  | Директория с config nginx |
| nginx.user_name |  nginx  |    Имя пользователя в   nginx.conf        |
| lighthouse.repo |  https://github.com/VKCOM/lighthouse.git| Репозиторий lighthouse
| lighthouse.www-dest | /opt/lighthouse | Директория, куда клонируется lighthouse из git
| lighthouse.nginx_conf| /etc/nginx/nginx.conf | Директория nginx.conf для lighthouse

Example Playbook
----------------


    - hosts: lighthouse
      roles: lighthouse

License
-------

BSD
