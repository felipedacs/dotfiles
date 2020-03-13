#!/usr/bin/env bash
#
# install.sh - Padrão de instalação inicial no linux
#
# Site:             neni.dev/dotfiles
# Autor/Mantenedor: Felipe Silva - github.com/nenitf
# ---------------------------------------------------------- #
# Esse sript linka arquivos de configuração (dotfiles)
# selecionados para linux
# ---------------------------------------------------------- #
# Agradecimentos:
#
# Matheus Muller:
#   https://www.udemy.com/shell-script-do-basico-ao-profissional/
#
# gbencke durante o meetup de python em 2018 onde explicou as
# vantagens da portabilidade dos dotfiles:
#   https://github.com/gbencke
#
# Luke por disponibilizar material de alta qualidade sobre linux:
#   http://lukesmith.xyz
#
# A todos que disponibilizaram seus dotfiles online:
#   Luke Smith: https://github.com/LukeSmithxyz/voidrice
#   Filipe Deschamps: https://github.com/filipedeschamps/dotfiles
#   gbencke: https://github.com/gbencke/dotfiles
#   Denys Dovhan: https://github.com/denysdovhan/dotfiles
#   Mathias Bynens: https://github.com/mathiasbynens/dotfiles
#   Lars Kappert: https://github.com/webpro/dotfiles
#   Lars Kappert: https://github.com/webpro/awesome-dotfiles
# ---------------------------------------------------------- #

# -------------------------- MAIN -------------------------- #
mkdir -p ~/dev/desh
mkdir -p ~/dev/php
mkdir -p ~/dev/front
mkdir -p ~/go/src/github.com/nenitf
mkdir -p ~/go/src/gitlab.com/nenitf
mkdir -p ~/dev/tex
mkdir -p ~/dev/python

mkdir -p $HOME/.config

DIRDF=$HOME/dev/dotfiles

# bash
ln -vsf $DIRDF/bash/.bash_profile $HOME/.bashrc
touch $HOME/.extra

# x
ln -vsf $DIRDF/x/.xinitrc $HOME/.xinitrc
ln -vsf $DIRDF/x/.Xdefaults $HOME/.Xdefaults

# zathura
ln -vsf $DIRDF/zathura ~/.config

# git
ln -vsf $DIRDF/git/.gitconfig $HOME/.gitconfig

# vim
ln -vsf $DIRDF/vim/vimrc $HOME/.vimrc
ln -vsf $DIRDF/vim/gvimrc $HOME/.gvimrc

# dialog
ln -vsf $DIRDF/x/.dialogrc $HOME/.dialogrc
