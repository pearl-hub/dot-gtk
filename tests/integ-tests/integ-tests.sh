#!/usr/bin/env bash

set -e

source $HOME/.bashrc

echo -e "\n\n" | pearl --verbose install test

[ -d $PEARL_HOME/packages/local/test ] || { echo "Error: The package test does not exist after installing it."; exit 1; }

cat $HOME/.gtkrc-2.0
cat $HOME/.config/gtk-3.0/settings.ini

echo -e "\n\n" | pearl --verbose update test

pearl --no-confirm --verbose remove test

cat $HOME/.gtkrc-2.0
ls -l $HOME/.config/gtk-3.0
