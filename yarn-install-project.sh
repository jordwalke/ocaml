#!/usr/bin/env bash
# Check if space exists in path
if [[ "$(pwd)" =~ ( |\') ]]
then
    echo "**************************************************************"
    echo "ERROR: refuse to work with a path containing space: \"$(pwd)\""
    echo "**************************************************************"
    exit 1
fi
echo "Configuring the OCaml compiler to use the CC environment variable"
echo "which is currently set to ($CC) - and defaults to gcc."
set -e
set -x
./configure -cc "$CC" -no-cfi -prefix $(pwd)
make world.opt
make install
