# Домашнее задание к занятию 1 «Введение в Ansible»

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.
![Alt text](img/image.png)
2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

![Alt text](img/image-1.png)

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

![Alt text](img/image-2.png)

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.
```
ansible-playbook -i inventory/prod.yml site.yml -vvv
```
![Alt text](img/image-3.png)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

![Alt text](img/image-5.png)

![Alt text](img/image-6.png)

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

![Alt text](img/image-4.png)

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

![Alt text](img/image-7.png)

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

![Alt text](img/image-8.png)

![Alt text](img/image-9.png)

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

![Alt text](img/image-10.png)

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

![Alt text](img/image-11.png)

11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

![Alt text](img/image-12.png)

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.
13. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.
```
ansible-vault decrypt group_vars/deb/examp.yml group_vars/el/examp.yml
```
![Alt text](img/image-13.png)
2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.

![Alt text](img/image-14.png)

![Alt text](img/image-15.png)


3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.

![Alt text](img/image-16.png)

4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).

![Alt text](img/image-19.png)

![Alt text](img/image-20.png)

5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
```
#!/bin/bash

# vars
images=("fnndsc/centos-python3" "pycontribs/fedora" "myubuntu")
inventory=(inventory/prod.yml)
playbook=(site.yml)
export ANSIBLE_VAULT_PASSWORD_FILE=secret

# cycle
for image in "${images[@]}"
do
    echo "Запуск контейнера с образом $image"
    docker run -d --name ${image%%/*} --entrypoint=/bin/bash $image -c 'tail -f /dev/null'
done

#run playbook
ansible-playbook -i ${inventory} ${playbook}

#stop and rm containers
for image in "${images[@]}"
do
    echo "Удаление контейнера с образом $image"
    docker rm -f ${image%%/*} 
done
```

![Alt text](img/image-17.png)

![Alt text](img/image-18.png)


6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.
https://github.com/Dmitrywh1/mnt-homeworks/tree/MNT-video/08-ansible-01-base/playbook

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
