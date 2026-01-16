#!/bin/bash

DIR="$(dirname "$0")"
cd "$DIR" || exit

. ../../scripts/functions.sh

# if ! which awesome; then
#   error "AwesomeWM is not downloaded yet."
#   exit 5
# fi

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/pipewire)"

info "Setting up wireplumber..."

printf "SOURCE FILE:     \t\t %s\n" "$SOURCE"
printf "DESTINATION FILE:\t\t %s\n" "$DESTINATION"

substep_info "Creating folder for wireplumber"
mkdir -vp "$DESTINATION/pipewire.conf.d"

substep_info "Linking wireplumber Configuration..."
fd --type f --exclude setup.sh | while read -r fn; do
  symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done
clean_broken_symlink "$DESTINATION"
