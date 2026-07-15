#!/usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../../scripts/functions.sh

if ! which polybar; then
  error "Polybar is not downloaded yet."
  exit 5
fi

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/polybar)"

info "Settings up polybar shell..."

printf "SOURCE FILE:     \t\t %s\n" "$SOURCE"
printf "DESTINATION FILE:\t\t %s\n" "$DESTINATION"

# substep_info "Creating Polybar Config Folder"

substep_info "Linking Polybar Configuration..."
fd --type f --exclude setup.sh | while read -r fn; do
  symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done
clean_broken_symlink "$DESTINATION"
