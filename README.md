# my vim config
clone into home     
```$ cd ~```  
```$ git clone https://github.com/bitwitch/.vim.git```

symlink config file  
```$ ln -sf .vim/.vimrc ~/.vimrc```  

Reload .vimrc and :PlugInstall to install plugins.

*optional*  
change leader + cc to TOGGLE comments
1. ```$ vim ~/.vim/plugged/nerdcommenter/plugin/NERD_commenter.vim```  
2. scroll to the bottom of the file where the keymappings are and swap the key
   bindings for Comment and Toggle. By default Comment is leader + c[space]
   and Toggle is leader + cc.

