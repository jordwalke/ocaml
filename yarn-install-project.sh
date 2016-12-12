#!/usr/bin/env bash
# Check if space exists in path
if [[ "$(pwd)" =~ ( |\') ]]
then
    echo "**************************************************************"
    echo "ERROR: refuse to work with a path containing space: \"$(pwd)\""
    echo "**************************************************************"
    exit 1
fi
set -e
set -x
./configure -no-cfi -prefix $(pwd)
make world.opt
make install
