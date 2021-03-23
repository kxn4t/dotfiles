#!/bin/sh
git config --global merge.ff false
git config --global pull.ff only
git config --global color.ui true
git config --global core.editor vim
git config --global core.quotepath false
git config --global alias.push-f "push --force-with-lease"
mkdir ~/Workspace
git config --global ghq.root ~/Workspace

# set name & email
read -p 'Please enter your user name: ' gitname
git config --global user.name $gitname
read -p 'Please enter your email: ' gitemail
git config --global user.email $gitemail

echo '==== Complete git configuration ======='
git config -l | cat
