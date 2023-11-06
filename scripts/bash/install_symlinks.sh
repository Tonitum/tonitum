#!/bin/bash

# Symlink .bashrc, .bash_aliases, nvim config and tmux sessionizer in the home
# directory for the current user

# get the home directory
home_dir=${HOME} # TODO: add a default here

# get the git repo dir
echo $(dirname "$0")
echo "The script you are running has:"
echo "basename: [$(basename "$0")]"
echo "dirname : [$(dirname "$0")]"
echo "pwd     : [$(pwd)]"
