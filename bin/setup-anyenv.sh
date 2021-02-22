#!/bin/zsh
anyenv install --init
anyenv install nodenv
exec $SHELL -l # reboot shell
nodenv install 14.15.5
nodenv global 14.15.5
