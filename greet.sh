a="Доброе утро!"
b="Добрый день!"
c="Добрый вечер!"
d="Доброй ночи!"
x=`date +%H`

if [ $x -le 5 ]; then
	echo "$d `date -R`"
elif [ $x -le 12 ]; then
        echo "$a `date -R`"
elif [ $x -le 17 ]; then
        echo "$b `date -R`"
elif [ $x -le 22 ]; then
        echo "$c `date -R`"
else
        echo "$d `date -R`"
fi       

