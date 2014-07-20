#!/usr/bin/env python
# coding: utf8

"""
    sneak.py - Linux command-line logger (streamline history files)

    :copyright: (c) 2014 Anders Aarvik
    :author: Anders Aarvik (aarvik92@gmail.com) and contributors
    :license: MIT licensed. See LICENSE.txt
"""

import os
import time
import datetime
import threading


class Sneak(object):

    def __init__(self):

        self.sneak_log_file = '/var/log/cli.log'
        self.scan_dirs = '/home/ /root/'
        self.system_wide_conf = '/etc/profile'
        self.append_history = 'export PROMPT_COMMAND="history -a"'
        self.timestamp = None
        self.datetime = None
        self.histories = None

    def run(self):

        self.ensure_live_history(self.system_wide_conf)

        self.init_message()

        for history in self.get_histories():
            t = threading.Thread(target=self.log_definer, args=(history,))
            t.start()

    def get_histories(self):

        self.histories = os.popen("sudo find %s -type f -name '*_history'" % self.scan_dirs).readlines()
        self.histories = [shell_histories_newline.replace('\n', '') for shell_histories_newline in self.histories]
        self.histories = [shell_histories_whitespace.replace(' ', '') for shell_histories_whitespace in self.histories]

        return self.histories

    def ensure_live_history(self, system_wide_conf):

        with open(system_wide_conf, 'r') as f:
            env_list = f.readlines()
            f.close()
            found_line = False
            for line in env_list:
                if str(self.append_history) in line:
                    found_line = True

            if not found_line:
                with open(system_wide_conf, 'a') as f:
                    f.write(str(self.append_history)+"\n")

                os.system("source %s" % system_wide_conf)

            f.close()

    def log_definer(self, history):

        with open(history) as f:
            while True:
                line = f.readline()
                if not line:
                    break
                else:
                    last_line = line
        f.close()

        while True:
            with open(history) as f:
                lines = f.readlines()
                f.close()

                if lines[-1] != last_line:
                    self.timestamp = time.time()
                    self.datetime = datetime.datetime.fromtimestamp(self.timestamp).strftime('%Y-%m-%d %H:%M:%S')
                    last_line = lines[-1]

                    self.log_writer(self.datetime, history, last_line)
                else:
                    time.sleep(1)

    def log_writer(self, datetime, history, line):

        with open(self.sneak_log_file,"a+") as f:
            f.write('[%s - %s] Command: %s' % (datetime, history, line))

    def init_message(self):

        print('')
        print('sneak.py - Linux command-line logger (streamline history files)')
        print('--------------------------------------------------------------------------')
        print('Log file: %s' % self.sneak_log_file)
        print('')
        print('History files found:')
        print(self.get_histories())
        print('')
        print('Scanned dirs: %s' % self.scan_dirs)
        print('--------------------------------------------------------------------------')
        print('')

if __name__ == '__main__':

    sneak = Sneak()
    sneak.run()
