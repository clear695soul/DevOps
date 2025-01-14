#!/usr/bin/bash
# shellcheck disable=SC2269
name_role="$name_role"


echo "Введите название роли: " # запрос имени роли для создания структуры
read -r name_role
echo "создан каталог = $name_role"

mkdir "$name_role" # создаст каталог для новой роли

cd "$name_role"/ || exit # переход в каталог с ролью

mkdir defaults files handlers meta templates tasks vars # создание структуры каталогов
touch defaults/main.yml handlers/main.yml meta/main.yml tasks/main.yml vars/main.yml README.md
echo "This is $name_role role" >> README.md
echo "Cоздана структура каталогов для роли $name_role в директории $PWD/$name_role"
exit 0