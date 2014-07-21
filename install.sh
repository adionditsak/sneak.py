#!/bin/sh

echo "Downloading sneak.py"
curl -OL https://github.com/adionditsak/sneak.py/archive/master.zip

echo "Unzipping sneak.py"
unzip master.zip

cd sneak.py-master

echo "Creating /usr/local/bin/sneak/"
mkdir -p /usr/local/bin/sneak/

echo "Copying sneak.py to /usr/local/bin/sneak/ and sneek (init) to /etc/init.d/"
cp sneak /etc/init.d/sneak
cp sneak.py /usr/local/bin/sneak/sneak.py

echo "Making files executable"
chmod +x /etc/init.d/sneak /usr/local/bin/sneak/sneak.py

echo "Done - remember to move the master.zip and the sneak.py-master files"
