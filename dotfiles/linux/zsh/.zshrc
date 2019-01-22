export GPG_TTY=$(tty)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color

ZSH_THEME="materialshell"

source ~/.zplug/init.zsh
source ~/.zsh_aliases


zplug "zplug/zplug"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

# Support oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "themes/robbyrussell", from:oh-my-zsh
zplug "themes/ys", from:oh-my-zsh
zplug "carloscuesta/materialshell", use:materialshell, from:github, as:theme

zplug load #--verbose

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
