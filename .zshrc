#Disable beep if on tty
if [[ -n "$DISPLAY" ]]; then
else
	setterm -blength 0
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#For zsh-autosuggestions
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

#Plugin Manager
source $HOME/antigen.zsh

#Some exports for something which I dont remember
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"

#The holy path
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/$HOME/.local/bin:$HOME/mybin:/home/madhavpcm/.config/local/share/gem/ruby/3.0.0/bin:/home/madhavpcm/.cargo/bin:$PATH"


#Zoxide and z
eval "$(zoxide init zsh)"

#Perl stuff 
PATH="/home/madhavpcm/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/madhavpcm/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/madhavpcm/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/madhavpcm/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/madhavpcm/perl5"; export PERL_MM_OPT;

#Dotfiles
alias config='/usr/bin/git --git-dir=/home/madhavpcm/.cfg/ --work-tree=/home/madhavpcm/'
#
#For X11 Lock
alias lockctl='/usr/bin/betterlockscreen -l'
#
#Vi Bindings for zsh
bindkey -v

#Mangohud
MANGOHUD_CONFIGFILE="~/.config/mangohud/mangohud.conf"

#Qt Theme
export QT_QPA_PLATFORMTHEME=qt5ct

#Default editor for git and crap
export EDITOR="nvim"
export VISUAL="nvim"

#vi edit
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#Theme  To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic


#Forgot
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

#myexpos
#alias xfsi="cd $HOME/myexpos/xfs-interface/ && ./xfs-interface; cd -"
export STAGE="$HOME/myexpos/assignments/stage"
export SPL="$HOME/myexpos/spl/spl_progs"
export EXPL="$HOME/myexpos/expl/expl_progs"

#Wayland geng only
export _JAVA_AWT_WM_NONREPARENTING=1
export BINDGEN_EXTRA_CLANG_ARGS="$BINDGEN_EXTRA_CLANG_ARGS -DPW_ENABLE_DEPRECATED"
#export QT_LOGGING_RULES="qt.qpa.*=true"
#export WAYLAND_DEBUG=1
export MOZ_ENABLE_WAYLAND=1

#Plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen theme romkatv/powerlevel10k
antigen apply

