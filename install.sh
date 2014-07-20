#!/bin/bash

curl -OL https://github.com/adionditsak/sneak.py/archive/master.zip
unzip master.zip
cd sneak.py-master
mkdir -p /usr/local/bin/sneak/
cp sneak /etc/init.d/sneak
cp sneak.py /usr/local/bin/sneak/sneak.py
chmod +x /etc/init.d/sneak /usr/local/bin/sneak/sneak.py
