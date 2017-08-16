#!/bin/bash
COUNTER=0
  while [ $COUNTER -lt 5 ]; do
       tmux kill-session -t script
           tmux new-session -s script "./telegram-cli -s bot.lua"
        tmux detach -s script
    sleep 1
  done
