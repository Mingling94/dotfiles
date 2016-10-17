#!/bin/bash
# start poloniex lending bot in background

cd "/home/ming/Github/poloniexlendingbot"
nohup python lendingbot.py > ../poloniexlendingbot.log 2>&1&
echo $! > /tmp/poloniexlendingbot.pid
