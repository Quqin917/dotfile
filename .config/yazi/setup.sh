#!/usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR" || exit

. ../../scripts/functions.sh

if ! which yazi; then
  error "Yazi is not downloaded yet."
  exit 5
fi

SOURCE="$(realpath .)"
DESTINATION="$(realpath ~/.config/yazi)"

info "Settings up yazi shell..."

printf "SOURCE FILE:     \t\t %s\n" "$SOURCE"
printf "DESTINATION FILE:\t\t %s\n" "$DESTINATION"

substep_info "Creating Yazi Config Folder"
mkdir -vp "$DESTINATION"

substep_info "Linking Yazi Configuration..."
fd --type f --exclude setup.sh | while read -r fn; do
  symlink "$SOURCE/$fn" "$DESTINATION/$fn"
done
clean_broken_symlink "$DESTINATION"
