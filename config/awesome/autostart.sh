#!/usr/bin/env bash

run_once() {
  if ! pgrep -f "$1" > /dev/null; then
    "$@"
  fi
}

run_background() {
  if ! pgrep -f "$1" > /dev/null; then
    "$@" &
  fi
}

run_bypass_offload() {
  if ! pgrep -f "$1" > /dev/null; then
    # __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"
    __NV_PRIME_RENDER_OFFLOAD=1 "$@"
  fi
}

run_once "picom" "--config" "/home/quqin/dotfiles/config/picom/picom.conf" "-b"
