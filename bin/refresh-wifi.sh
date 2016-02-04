#!/bin/bash
# Restarts the network-manager service to reconnect to wifi signal
# Generally attach to Ctrl+Alt+W

echo "FILL_IN_PW" | sudo -S service network-manager restart \
	&& echo "Network manager restarting..."
