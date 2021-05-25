#!/bin/bash


user=$(whoami)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


############################ Setup calibre (latest)

sudo apt install -y wget
#sudo apt install -y calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin
sudo apt install -y python3-pip

which ebook-convert > /dev/null

if [ $? != 0 ]; then
    echo "Installation failed" ; exit 1
fi

sudo -H  pip3 install -r "$DIR/requirements.txt"


########################### Download recipes

if [ ! -d "$DIR/docs" ]
then
    mkdir -p "$DIR/docs"
fi


if [ ! -d "$DIR/recipes" ]
then
    mkdir -p "$DIR/recipes"
else
    rm "$DIR/recipes/"*
fi


for recipe in $(cat "$DIR/recipes.url")
do
    wget $recipe --directory-prefix "$DIR/recipes"
done

############################ Setup Cron

TEMP_CRON="$DIR/cron"

echo "0 6 * * *  python3  $DIR/downloader.py" >  $TEMP_CRON

crontab $TEMP_CRON
rm $TEMP_CRON
