# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# zplug init
export ZPLUG_HOME=$HOME/.zplug

[[ ! -f $ZPLUG_HOME/init.zsh ]] && git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# do self-manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# auto-close quotes and brackets like a pro
zplug 'hlissner/zsh-autopair', defer:2, as:plugin
zplug "lib/history",      from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/termsupport", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
# another eyecandy
zplug 'zdharma/fast-syntax-highlighting', defer:2, hook-load:'FAST_HIGHLIGHT=()', as:plugin

#zplug "zsh-users/zsh-syntax-highlighting", defer:2, as:plugin

zplug "zsh-users/zsh-autosuggestions", defer:2, as:plugin

#zplug "zpm-zsh/ls", defer:2, as:plugin
#zplug "zpm-zsh/dircolors-material", as:plugin
#zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme, as:theme
zplug romkatv/powerlevel10k, as:theme, depth:1
# finally install and load those plugins
# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load 

# returning command and folder completion when line is empty
# like a bash, but better
blanktab() { [[ $#BUFFER == 0 ]] && CURSOR=3 zle list-choices || zle expand-or-complete }
zle -N blanktab && bindkey '^I' blanktab


# load my own aliases
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

#############################
# Customized Powerlevel9k #
#############################



# export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH="~/.npm-global/bin:$PATH"
export LANG="en_US.UTF-8"
alias cekram="sudo ps_mem"
alias cekcpu="watch -n 0.5 sudo cpupower monitor"
alias sukate="SUDO_EDITOR=kate sudoedit "
alias powerpc="sudo cpupower frequency-set -g performance"
alias lowpc="sudo cpupower frequency-set -g powersave"
alias neo='neofetch --config ~/.config/neofetch/config.conf'
#alias vga="DRI_PRIME=1 "
alias lammp="cd /opt/lampp && sudo ./manager-linux-x64.run"
#alias gdrive="/opt/OpenDrive/odrive"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
