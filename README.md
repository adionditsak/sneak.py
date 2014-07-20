sneak.py
========

Linux command-line logger (streamline history files)

Streamline history files with timestamp to /var/log/cli.log for command-line logging.

Very early stage - contributions and good ideas appreciated.

Tested on Debian and Redhat based distros.

###Installation steps

####Shell steps

    curl -OL https://github.com/adionditsak/sneak.py/archive/master.zip
    unzip master.zip
    cd sneak.py-master
    mkdir -p /usr/local/bin/sneak/
    cp sneak /etc/init.d/sneak
    cp sneak.py /usr/local/bin/sneak/sneak.py
    chmod +x /etc/init.d/sneak /usr/local/bin/sneak/sneak.py

####Copy/paste oneliner

    curl -L https://raw.githubusercontent.com/adionditsak/sneak.py/master/install.sh | sh -

###Usage

    [root@server ~]# /etc/init.d/sneak start
    Sneak started.
    [root@server ~]#
    sneak.py - Linux command-line logger (streamline history files)
    --------------------------------------------------------------------------
    Log file: /var/log/cli.log

    History files found:
    ['/home/user1/.bash_history', '/home/user2/.bash_history', '/home/user3/.bash_history', '/home/user4/.bash_history', '/root/.bash_history', '/root/.mysql_history']

    Scanned dirs: /home/ /root/
    --------------------------------------------------------------------------

####Sample output

    root@server:~# tail -f /var/log/cli.log
    [2014-07-19 11:38:06 - /root/.bash_history] Command: ls
    [2014-07-19 11:38:12 - /root/.bash_history] Command: clear
    [2014-07-19 11:38:15 - /root/.bash_history] Command: which $SHELL
    [2014-07-19 11:38:19 - /root/.bash_history] Command: yes
    [2014-07-19 11:38:26 - /root/.bash_history] Command: cd /var/log/
    [2014-07-19 11:38:27 - /root/.bash_history] Command: ls
    [2014-07-19 11:38:29 - /root/.bash_history] Command: clear
    [2014-07-19 11:38:30 - /root/.bash_history] Command: ls
    [2014-07-19 13:53:00 - /root/.bash_history] Command: sh
    [2014-07-20 10:39:53 - /root/.bash_history] Command: ps aux | grep python
