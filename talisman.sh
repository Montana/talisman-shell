#!/bin/bash

set -euo pipefail

echo_error() {
        echo -ne $(tput setaf 1) >&2
        echo "$1" >&2
        echo -ne $(tput sgr0) >&2
}

echo_success() {
        echo -ne $(tput setaf 2)
        echo "$1" >&2
        echo -ne $(tput sgr0)
}

if ! command -v git &>/dev/null; then
        echo_error "Git is not installed. Please install Git and try again."
        exit 1
fi

if command -v talisman &>/dev/null; then
        echo_error "Talisman is already installed."
        exit 1
fi

echo "Installing Talisman..."
git clone https://github.com/thoughtworks/talisman.git
cd talisman
make install
cd ..
rm -rf talisman

if ! command -v talisman &>/dev/null; then
        echo_error "Talisman installation failed."
        exit 1
fi

echo_success "Talisman is installed successfully."
