sneak.py
========

Linux command-line logger (streamline history files)
    
Streamline history files with timestamp to /var/log/cli.log for command-line logging.

Very early stage - contributions and good ideas appreciated.

###Installation steps

    curl -OL https://github.com/adionditsak/sneak.py/archive/master.zip
    unzip master.zip
    cd sneak.py-master
    mkdir -p /usr/local/bin/sneak/
    cp sneak /etc/init.d/sneak
    cp sneak.py /usr/local/bin/sneak/sneak.py
    chmod +x /etc/init.d/sneak /usr/local/bin/sneak/sneak.py


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

