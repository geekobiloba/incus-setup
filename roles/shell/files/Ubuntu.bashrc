export LESS="-Ri"
export PROMPT_COMMAND="echo"

# Incus tools
test -d /opt/incus/bin && PATH=$_:$PATH && export PATH

# root's prompt
if [[ $EUID -eq 0 ]] ; then
  PS1='\[\e[1;31m\][\u@\h:\w]\$\[\e[m\] '
fi

# fzf
test -r /usr/share/bash-completion/completions/fzf    && . $_
test -r /usr/share/doc/fzf/examples/completion.bash   && . $_
test -r /usr/share/doc/fzf/examples/key-bindings.bash && . $_

# Aliases
alias   rm="rm -i"
alias   mv="mv -i"
alias   cp="cp -i"
alias   rl="readlink -f"
alias   ip="ip --color=auto"
alias   fd="fdfind"
alias  cls="clear"
alias  bat="batcat"
alias  sed="sed -E"
alias grep="grep -E --color=auto"
alias diff="diff --color"
alias  lla="ll"
alias  llt="ll -t"
alias  llh="ll -h"
alias llah="llh"
alias sudo="sudo "
alias nano="micro"

# vim:ft=bash:
