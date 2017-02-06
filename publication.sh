#!/bin/bash

SETCOLOR_SUCCESS="echo -en \\033[1;32m"
SETCOLOR_FAILURE="echo -en \\033[1;31m"
SETCOLOR_NORMAL="echo -en \\033[0;39m"
SETCOLOR_DIALOG="echo -en \\033[36;1m"


function indicatorOkFail {

if [ $? -eq 0 ]; then
    $SETCOLOR_SUCCESS
    echo -n "$(tput hpa $(tput cols))$(tput cub 6)[OK]"
    $SETCOLOR_NORMAL
    echo
else
    $SETCOLOR_FAILURE
    echo -n "$(tput hpa $(tput cols))$(tput cub 6)[fail]"
    $SETCOLOR_NORMAL
    echo
fi
}

$SETCOLOR_DIALOG
echo -n -e "Опубликовать на веб страничьке? (y/n)"
$SETCOLOR_NORMAL
read item
case "$item" in
    y|Y) echo "Ввели «y», продолжаем..."
#echo -ne 'Копирование...\r'
cp --recursive /home/raymond/dev/snake_game/src/* /home/raymond/dev/snake_game_pg/
indicatorOkFail
#echo -ne 'Переход в папку /home/raymond/dev/snake_game_pg/ ...\r'
cd /home/raymond/dev/snake_game_pg/
indicatorOkFail
#echo -ne 'Переход на ветку  gh-pages ...\r'
git checkout gh-pages
indicatorOkFail
#echo -ne 'Добавляем изменения ...\r'
git add .
indicatorOkFail
#echo -ne 'Делаем коммит ...\r'
git commit -m "Automatic"
indicatorOkFail
#echo -ne 'Отправка на сервер GitHub ...\r'
git push origin gh-pages
indicatorOkFail
echo -ne '\n'
        ;;
    n|N) echo "Ввели «n», завершаем..."
        exit 0
        ;;
    *) echo "Ничего не ввели"
        ;;
esac

