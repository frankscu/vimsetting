#terminal设置
#export PS1="[\u@mac:\w]\$ > "
#export CLICOLOR="xterm-color"

# Black backgroud
#export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
#export LSCOLORS=cxfxhxhxgxhxhxgxgxbxbx

#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

export LICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

if [ -f ~/.bashrc ]; then
 	source ~/.bashrc
fi


