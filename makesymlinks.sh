#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dotfilesdir=$HOME/.dotfiles                    # dotfiles directory
olddir=$HOME/.dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc gitconfig zshrc gitignore_global"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dotfilesdir directory"
cd $dotfilesdir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing ~/.$file from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dotfilesdir/$file ~/.$file
done
