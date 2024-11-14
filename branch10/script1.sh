#!/usr/bin/env bash
HOME_D="$home/myfolder"
if [ -e "$HOME_D" ]
then
    echo "Каталог $HOME_D уже существует, удалите его и перезапустите скрипт."
else
    mkdir "$HOME"/myfolder
    echo "Каталог $HOME_D создан"
    
    touch "$HOME_D"/1
    echo -e "Hello! \n$(date +"%Y-%m-%d_%H:%M")" >  "$HOME_D"/1
    echo "$HOME_D/1 создан"

    touch "$HOME_D"/2
    sudo chmod 777 "$HOME_D"/2
    echo "$HOME_D/2 создан и установлены права"

    touch "$HOME_D"/3
    i=0
    while [ $i -lt 20 ]
    do
        echo -n $((1 + $RANDOM % 9)) >> "$HOME_D"/3
        i=$(( $i + 1))
    done
    echo "$HOME_D/3 создан"

    touch "$HOME_D"/4
    echo "$HOME_D/4 создан"
    touch "$HOME_D"/5
    echo "$HOME_D/5 создан"
fi
