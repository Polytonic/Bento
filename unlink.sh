#! /usr/bin/env zsh
set -euo pipefail

# Determine Absolute Working Path
REPOSITORY_ROOT=$(git rev-parse --show-toplevel)

# Load symlink definitions
source "${REPOSITORY_ROOT}/system/symlinks.sh"

for entry in "${BENTO_SYMLINKS[@]}"; do
    link="${entry%%:*}"
    if [ -L "$link" ]; then
        /bin/rm "$link"
        echo "Removed: $link"
    fi
done

# Remove Dock Sentinel so Next Bootstrap Re-runs Dock Setup
DOCK_SENTINEL="${HOME}/.config/bento/.dock-configured"
if [ -f "${DOCK_SENTINEL}" ]; then
    /bin/rm "${DOCK_SENTINEL}"
    echo "Removed: ${DOCK_SENTINEL}"
fi

echo "Done. Original files in the repo are untouched."
