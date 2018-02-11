#!/bin/bash
# Fetch release informations from GitHub.
#
# Works with prometheus repositories.

NAME="prometheus/alertmanager"
TMPFILE=$(mktemp /tmp/buildazzo.XXXXXX)


fetch_release() {
    local repo="$1"
    local release_file checksum_file version

    curl -sL -H "Content-Type: application/json" -o "$TMPFILE" "https://api.github.com/repos/${repo}/releases/latest"

    version=$(jq -r .tag_name "$TMPFILE")
    release_file=$(jq -r '.assets[] | if .name | match("linux-amd64") then .browser_download_url else empty end' "$TMPFILE")
    checksum_file=$(jq -r '.assets[] | if .name | match("sha256sums") then .browser_download_url else empty end' "$TMPFILE")
    checksum=$(curl -sL "$checksum_file" | grep -w "$(basename $release_file)" | awk '{ print $1 }')
    echo "$NAME version $version"
    echo "$release_file"
    echo "$checksum"
}

cleanup() {
    rm -f "$TMPFILE"
}

trap cleanup EXIT ERR

if [[ -n "$1" ]]; then
    fetch_release "$1"
else
    echo "Usage: $(basename $0) <repository org/name>"
    exit 1
fi
