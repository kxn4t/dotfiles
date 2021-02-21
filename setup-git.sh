#!/bin/sh
git config --global pull.ff only
git config --global color.ui true
git config --global core.editor vim
git config --global core.quotepath false
mkdir ~/Develop
git config --global ghq.root ~/Develop

# set name & email
read -p 'Please enter your user name: ' gitname
git config --global user.name $gitname
read -p 'Please enter your email: ' gitemail
git config --global user.email $gitemail

echo '==== Complete git configuration ======='
git config -l | cat
