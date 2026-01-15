#!/bin/bash

DIR=$(dirname "$0")
cd "$DIR" || exit

. scripts/functions.sh

info "Prompting for sudo password..."
if sudo -v; then
  # Keep alive: update 'sudo' time stamp until 'setup.sh' is finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null&
  success "Sudo credential updated"
else
  error "Failed to obtain sudo credential."
fi

# Package manager control must to be executed first in order for the rest to work
./packages/setup.sh

./commands/setup.sh

substep_info "Check if yay is installed"

sudo pacman -S luarocks --noconfirm --needed

# Run all the setup.sh files one by one
fd --type f "setup.sh" . .config --exclude "packages" --exclude "commands" | while read -r step; do
    ./"$step"
done

success "Finished installing Dotfiles"
