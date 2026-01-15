#!/bin/bash

run() {
  if ! pgrep -f "$1" ; 
  then
    "$@"
  fi
}

# run "picom --config ~/.config/picom/picom.conf -b"
run "xrdb -merge ~/.Xresources"
