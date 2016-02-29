# .bashrc

. /etc/bashrc

path=$PATH
path=$path:~/Scripts
path=$path:/afs/awd.austin.ibm.com/projects/eclipz/c14/usr/vinceagf/c05/py
path=/afs/awd/projects/eclipz/c14/usr/vinceagf/c05/py/anaconda/bin:$path
export PATH=$path

# Project Setup
alias getLSF='bsub -P SSE -G p91_unit -M 8 -n 4 -q interactive -R "select[osname==linux]" xterm'
alias cdwa='cd /afs/awd.austin.ibm.com/projects/eclipz/c14/usr/smikes1/c06'
export PROJHOME='/afs/awd.austin.ibm.com/projects/eclipz/c14/usr/smikes1/c06'
alias ctewin='/afs/awd.austin.ibm.com/projects/eclipz/common/tools/bin/c14c06win -noXterm -myShell'

# Terminal Setup
#export PS1='\[\e[0m\][\[\e[1;34m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\] -- \[\e[0;33m\]\W\[\e[0m\]]\[\e[1;31m\]$\[\e[0m\]'
reset=$(tput sgr0)   # \e[0m
redb=$(tput setaf 1; tput bold) # \e[1;31m
green=$(tput setaf 2) # \e[0;32m
yellow=$(tput setaf 3) # \e[0;33m
blueb=$(tput setaf 4; tput bold) # \e[1;34m
export PS1='\[$blueb\]\u\[$reset\]@\[$green\]\h\[$reset\] -- \[$yellow\]\W\[$reset\]\[$redb\]$>\[$reset\]'
export EDITOR=gvim

# User specific aliases and functions
alias cp='cp -i'
alias ls='ls --color=auto -h'
alias ll='ls -l --color=auto -h'
alias rm='rm -i'
alias mv='mv -i'
alias mkdir='mkdir -pv'
alias du1='/usr/bin/du -hc --max-depth=1'
alias memhogs='ps -eo uname,pid,comm,pmem,rss --sort -rss | head -n 11'
alias cpuhogs='ps -eo uname,pid,comm,pcpu --sort -pcpu | head -n 11'
alias gnuplot='gnuplot -persist'
alias row2col='awk '\''{for(x=0;++x<=NF;)a[x","NR]=$x}END{for(y=0;++y<=NF;){for(z=0;++z<=NR;) {printf a[y","z] " ";}print ""}}'\'' FS=" "'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

function datecp {
    for file in "$@"
    do
        cp ${file} .${file}`date +_%Y%m%d_%R`;
    done
}
function mrgpdf {
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=$@;
}
