#!/bin/bash

while true ; do
  killall tmux
        killall telegram-cli-1222
    tmux new-session -d -s script "bash permag.sh"
        sleep 1000
done
