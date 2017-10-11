#快捷方式
alias clc='clear'
alias ll='ls -l'
alias la='ls -a'
#alias vi=‘mvim’
#alias vim='mvim' 

export CC=clang
export CXX=clang++

#bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

#homebrew
homebrew=/usr/local/bin:/usr/local/sbin
export PATH=$homebrew:$PATH

#远程登录
alias sshihep="ssh -Y chenlj@lxslc6.ihep.ac.cn"
export IHEP_DIR="chenlj@lxslc.ihep.ac.cn:/besfs/groups/higgs/users/chenlj"
alias sshdesktop="ssh -Y chenlj@192.168.237.86"
alias sshlocalhost="ssh -Y chenlj@192.168.22.31"
alias rz=lrz
alias sz=lsz

#ROOT
#source /usr/local/Cellar/root/6.08.06_1/libexec/thisroot.sh
source /usr/local/Cellar/root/5.34.36_2/libexec/thisroot.sh
alias vim=nvim

alias fangqiang="ssh -D 9999 liejian@lxplus.cern.ch"


