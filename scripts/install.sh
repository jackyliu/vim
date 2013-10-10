#!/bin/bash
TOPDIR=`pwd`
echo ${TOPDIR}
TARGET=~/.vim.orig
Timestamp=`date +%Y%m%d-%H%M%S`
echo ${x}
function backup_orig_plugin()
{
    echo "Move original ~/.vim to ~/vim.orig"
    if [ -e ~/.vim ]; then
        if [ ! -e ${TARGET} ]; then
            mkdir -pv ${TARGET}
        fi
        mv ~/.vim ${TARGET}/vim.${Timestamp}
        mv ~/.vimrc ~/.vimrc.local ${TARGET}/vim.${Timestamp}
    fi
}

function place_new_plugin() {
    echo "plance new plugin to ~/.vim"
    if [ -e plugins ] ; then
        cp -r plugins ~/.vim
        cp scripts/vimrc ~/.vimrc
        cp scripts/vimrc.local ~/.vimrc.local
    fi
}

backup_orig_plugin;
place_new_plugin;
