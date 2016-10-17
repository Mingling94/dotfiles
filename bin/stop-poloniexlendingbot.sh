#!/bin/bash
# stop poloniex lending bot in background

kill `cat /tmp/poloniexlendingbot.pid`
