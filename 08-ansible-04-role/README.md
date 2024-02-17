# Домашнее задание к занятию 4 «Работа с roles»

## Подготовка к выполнению

1. * Необязательно. Познакомьтесь с [LightHouse](https://youtu.be/ymlrNlaHzIY?t=929).
2. Создайте два пустых публичных репозитория в любом своём проекте: vector-role и lighthouse-role.
3. Добавьте публичную часть своего ключа к своему профилю на GitHub.

## Основная часть

Ваша цель — разбить ваш playbook на отдельные roles. 

Задача — сделать roles для ClickHouse, Vector и LightHouse и написать playbook для использования этих ролей. 

Ожидаемый результат — существуют три ваших репозитория: два с roles и один с playbook.

**Что нужно сделать**

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:

   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.13"
       name: clickhouse 
   ```

2. При помощи `ansible-galaxy` скачайте себе эту роль.

![alt text](image.png)

3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.
![alt text](image-1.png)
4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 
5. Перенести нужные шаблоны конфигов в `templates`.
6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).
7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.
8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.

```
- https://github.com/Dmitrywh1/Vector-role
- https://github.com/Dmitrywh1/lighthouse-role
```

```
---
  - src: https://github.com/AlexeySetevoi/ansible-clickhouse.git
    scm: git
    version: "1.13"
    name: clickhouse
    
  - src: https://github.com/Dmitrywh1/Vector-role.git
    scm: git
    version: "1.0.0"
    name: vector-role

  - src: https://github.com/Dmitrywh1/lighthouse-role.git
    scm: git
    version: "1.0.0"
    name: lighthouse
```

9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.

```
- name: install Lighthouse
  hosts: lighthouse
  become: yes
  roles:
    - role: lighthouse
- name: install Clickhouse
  hosts: clickhouse
  become: yes
  roles:
    - role: clickhouse
- name: install Vector
  hosts: vector
  become: yes
  roles:
    - role: vector-role
```

10. Выложите playbook в репозиторий.
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

- https://github.com/Dmitrywh1/Vector-role
- https://github.com/Dmitrywh1/lighthouse-role
- https://github.com/Dmitrywh1/mnt-homeworks/tree/MNT-video/08-ansible-04-role

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
