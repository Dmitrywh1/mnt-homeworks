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