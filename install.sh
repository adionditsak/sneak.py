#!/bin/sh

cecho(){
  LGREEN="\033[1;32m"
  LRED="\033[1;31m"
  YELLOW="\033[1;33m"
  NORMAL="\033[m"
 
  color=\$${1:-NORMAL}
 
  echo -ne "$(eval echo ${color})"
  cat
 
  echo -ne "${NORMAL}"
}

echo ""
echo "- Downloading sneak.py" | cecho LGREEN
curl -OL https://github.com/adionditsak/sneak.py/archive/master.zip

echo ""
echo "- Unzipping sneak.py" | cecho LGREEN
unzip master.zip

cd sneak.py-master;

echo ""
echo "- Creating /usr/local/bin/sneak/ directory" | cecho LGREEN
mkdir -p /usr/local/bin/sneak/

echo ""
echo "- Copying sneak.py to /usr/local/bin/sneak/ and sneak (init) to /etc/init.d/" | cecho LGREEN
cp sneak /etc/init.d/sneak
cp sneak.py /usr/local/bin/sneak/sneak.py

echo ""
echo "- CHMODDING files" | cecho LGREEN
chmod +x /etc/init.d/sneak /usr/local/bin/sneak/sneak.py

echo ""
echo "- Done" | cecho LGREEN

echo ""
echo "- Notes:"
echo "- Remove master.zip and sneak.py-master files from current directory" | cecho YELLOW
echo "- Start service with $ /etc/init.d/sneak start" | cecho LGREEN
