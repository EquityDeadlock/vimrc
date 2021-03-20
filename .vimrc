"Main Settings ##########
set tabstop=4
set shiftwidth=4
set number
set autoindent
set wildmenu
set nocompatible
set path+=**
filetype plugin on

map #1 :wq
map #2 :w

let extension=expand('%:e') 

"C Programming ##########
if extension == 'c'

set tabstop=2
set shiftwidth=2

map #3 :!gcc -g3 -std=gnu99 % -o %:r
map #4 :!./%:r
map #9 :!time ./%:r

abb PROG <C-R>=CreateProgram()<CR> 
abb PR fprintf(stdout, "");
abb FOR for(int i = 0; i < 5; i++)
abb TYP <C-R>=Typedef()<CR> 

function! Typedef()
	call append(".", "}struct_s;")
	call append(".", "")
	call append(".", "typedef struct STRUCT {")
	:.+2
endfun
function! CreateProgram()
	call append(".","}")
	call append(".","	return 0;")
	call append(".","	")
	call append(".","int main (int argc, char *argv[], char *envp[]) {")
	call append(".","")
	call append(".","#include <string.h>")
	call append(".","#include <stdlib.h>")
	call append("0","#include <stdio.h>")
	:.+6
endfun

endif
