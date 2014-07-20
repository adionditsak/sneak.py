#!/bin/sh

echo "Downloading sneak.py"
curl -OL https://github.com/adionditsak/sneak.py/archive/master.zip

echo "Unzipping sneak.py"
unzip master.zip

cd sneak.py-master

"Creating /usr/local/bin/sneak/"
mkdir -p /usr/local/bin/sneak/

"Copying sneak.py to /usr/local/bin/sneak/ and sneek (init) to /etc/init.d/"
cp sneak /etc/init.d/sneak
cp sneak.py /usr/local/bin/sneak/sneak.py

"Making files executable"
chmod +x /etc/init.d/sneak /usr/local/bin/sneak/sneak.py

"Removing zip and git directory"
rm -rf sneak.py-master/ master.zip

sleep 2
echo "Done"
