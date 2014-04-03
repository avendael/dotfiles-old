#!/bin/bash

dotfiles_dir="`pwd`"
cd ~
ln -s ${dotfiles_dir}/bash/.bash_profile .bash_profile
ln -s ${dotfiles_dir}/bash/.bashrc .bashrc
ln -s ${dotfiles_dir}/emacs/.emacs .emacs
ln -s ${dotfiles_dir}/emacs/.emacs.d .emacs.d
cd -