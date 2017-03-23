#!/bin/bash

while true ; do
  killall tmux -u tgGuard
        killall telegram-cli-1222 -u tgGuard
    tmux new-session -d -s script "bash permag.sh"
        sleep 1000
done
