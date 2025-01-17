# Домашнее задание к занятию 3 «Использование Ansible»

## Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.
2. Репозиторий LightHouse находится [по ссылке](https://github.com/VKCOM/lighthouse).

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.
[playbook](https://github.com/Dmitrywh1/mnt-homeworks/blob/08-ansible-03-yandex/08-ansible-03-yandex/playbook/site.yml)

```
Подсулунл в вектор логи access nginx
```

![alt text](image-4.png)

2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.
4. Подготовьте свой inventory-файл `prod.yml`.

![alt text](image.png)

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

```
Линтер ругается на мое условие, но я не стал его убирать
```
![alt text](image-1.png)

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

```
Так как --check пропускает TASK [Check if table exists], в которой происходит registred переменной и ее последующее использование в следующей таске, все фейлится.
```

![alt text](image-2.png)

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
```
done
```
![alt text](image-3.png)
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

[08-ansible-03-yandex](https://github.com/Dmitrywh1/mnt-homeworks/blob/08-ansible-03-yandex/08-ansible-03-yandex/playbook/readme.md)

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
