#!/bin/bash

dotfiles_dir="`pwd`"
cd ~
ln -s ${dotfiles_dir}/bash/.bash_profile .bash_profile
ln -s ${dotfiles_dir}/bash/.bashrc .bashrc
ln -s ${dotfiles_dir}/zshrc .zshrc
ln -s ${dotfiles_dir}/dotctags .ctags
cd -
