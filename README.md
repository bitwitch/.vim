# my vim config

## Linux
clone into home       
```$ cd ~```    
```$ git clone https://github.com/bitwitch/.vim.git```  

symlink config file   
```$ ln -sf .vim/.vimrc ~/.vimrc```  

Reload .vimrc and :PlugInstall to install plugins.  

## Windows
```$ cd %HOME%```    
```$ git clone https://github.com/bitwitch/.vim.git vimfiles```  

symlink config file  
**Note:** You must be running cmd as admin to make sym link  
```$ mklink _vimrc vimfiles\.vimrc```  

Reload _vimrc and :PlugInstall to install plugins.  

*optional*  
---
Change leader + cc to TOGGLE comments  
1. ```$ vim ~/.vim/plugged/nerdcommenter/plugin/NERD_commenter.vim```  
2. scroll to the bottom of the file where the keymappings are and swap the key  
   bindings for Comment and Toggle. By default Comment is leader + cc and  
   Toggle is leader + c[space].    
  
Install ctags to jump to function/variable declarations  
- Ubuntu  
```$ sudo apt-get install exuberant-ctags```  
- For other systems see [ctags website](http://ctags.sourceforge.net/)  

Create a batch file `C:\bin\init_shell.bat` that initializes the msvc compiler  
so that you can compile with F7 on windows.  
example:  
```
@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" x86_amd64
```
