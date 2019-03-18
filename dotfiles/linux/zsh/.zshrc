export GPG_TTY=$(tty)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export PATH=$PATH:~/.local/bin:~/.local/share/node-v10.15.2-linux-x64/bin

ZSH_THEME="materialshell"

source ~/.zsh/zplug/init.zsh
source ~/.zsh/aliases
source ~/.zsh/functions


zplug "zplug/zplug"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

# Support oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "themes/robbyrussell", from:oh-my-zsh
zplug "carloscuesta/materialshell", use:materialshell, from:github, as:theme

zplug load #--verbose

BASE16_SHELL=$HOME/.zsh/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

if command -v tmux &> /dev/null && [ -z "$TMUX" ];
  then tmux attach -t default || tmux new -s default
fi;


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/arvinatienza/.local/share/node-v10.15.2-linux-x64/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/arvinatienza/.local/share/node-v10.15.2-linux-x64/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/arvinatienza/.local/share/node-v10.15.2-linux-x64/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/arvinatienza/.local/share/node-v10.15.2-linux-x64/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/arvinatienza/.local/share/node-v10.15.2-linux-x64/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/arvinatienza/.local/share/node-v10.15.2-linux-x64/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
