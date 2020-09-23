##############################################################
#  ██████╗ ███╗   ███╗███╗   ██╗██╗██╗  ██╗██╗██╗     ███████╗
# ██╔═══██╗████╗ ████║████╗  ██║██║██║  ██║██║██║     ██╔════╝
# ██║   ██║██╔████╔██║██╔██╗ ██║██║███████║██║██║     ███████╗
# ██║   ██║██║╚██╔╝██║██║╚██╗██║██║██╔══██║██║██║     ╚════██║
# ╚██████╔╝██║ ╚═╝ ██║██║ ╚████║██║██║  ██║██║███████╗███████║
#  ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝
#
#    ███████╗███████╗██╗  ██╗██████╗  ██████╗
#    ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#      ███╔╝ ███████╗███████║██████╔╝██║
#     ███╔╝  ╚════██║██╔══██║██╔══██╗██║
# ██╗███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
##############################################################

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt share_history
setopt auto_param_slash                                         # add / to dir names in completion
setopt aliases                                                  # expand aliases
setopt auto_menu 												# menu after two tabs
setopt nocompletealiases 										# otherwise 'agi<TAB>' won't work...
setopt autopushd pushdignoredups 								# auto add dirs to dirstack, no dups
unsetopt menucomplete 											# don't use menu for completion<Paste>
setopt clobber 													# allow >file truncate, >>file creation
setopt histignorespace 											# hist ignores cmd beginning with <Space>



zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*:processes' command 'ps -A'
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=5000
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# load zgen
 source "${HOME}/.zgen/zgen.zsh"


## Keybindings section
# vim line-editing:
bindkey -v
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
# bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' vi-forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

## Alias section
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias gitu='git add . && git commit && git push'
alias md='mkdir -p'

## ~/.aliases
source ~/.aliases

# Theming section
autoload -U compinit colors zcalc
compinit -d
colors

# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# enable substitution for prompt
setopt prompt_subst

# Prompt (on left side) similar to default bash prompt, or redhat zsh prompt with colors
 #PROMPT="%(!.%{$fg[red]%}[%n@%m %1~]%{$reset_color%}# .%{$fg[green]%}[%n@%m %1~]%{$reset_color%}$ "
# Maia prompt
PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " # Print some system information when the shell is first started
# Print a greeting message when shell is started
echo $USER@$HOST  $(uname -srm) $(lsb_release -rcs)
## Prompt on right side:
#  - shows status of git when in git repository (code adapted from https://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
#  - shows exit status of previous command (if previous command finished with an error)
#  - is invisible, if neither is the case

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"                              # plus/minus     - clean repo
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"             # A"NUM"         - ahead by "NUM" commits
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"           # B"NUM"         - behind by "NUM" commits
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"     # lightning bolt - merge conflict
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"       # red circle     - untracked files
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"     # yellow circle  - tracked files modified
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"        # green circle   - staged changes present = ready for "git push"

parse_git_branch() {
  # Show Git branch/tag, or name-rev if on detached head
  ( git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD ) 2> /dev/null
}

parse_git_state() {
  # Show different symbols as appropriate for various Git repository states
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

git_prompt_string() {
  local git_where="$(parse_git_branch)"

  # If inside a Git repository, print its branch and state
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"

  # If not inside the Git repo, print exit codes of last command (only if it failed)
  [ ! -n "$git_where" ] && echo "%{$fg[red]%} %(?..[%?])"
}

# Right prompt with exit status of previous command if not successful
 #RPROMPT="%{$fg[red]%} %(?..[%?])"
# Right prompt with exit status of previous command marked with ✓ or ✗
 #RPROMPT="%(?.%{$fg[green]%}✓ %{$reset_color%}.%{$fg[red]%}✗ %{$reset_color%})"


# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

case $(basename "$(cat "/proc/$PPID/comm")") in
  login)
    	RPROMPT="%{$fg[red]%} %(?..[%?])"
    	alias x='startx ~/.xinitrc'      # Type name of desired desktop after x, xinitrc is configured for it
    ;;
  urxvt)
    	RPROMPT='$(git_prompt_string)'
    	# Use autosuggestion
    	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    	ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
    	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ;;
  konsole|qterminal)
    	RPROMPT='$(git_prompt_string)'
    ;;
  'tmux: server')
  	if $(ps -p$PPID| grep -q -e konsole -e qterminal); then
    	RPROMPT='$(git_prompt_string)'
    else
        RPROMPT='$(git_prompt_string)'
		## Base16 Shell color themes.
		#possible themes: 3024, apathy, ashes, atelierdune, atelierforest, atelierhearth,
		#atelierseaside, bespin, brewer, chalk, codeschool, colors, default, eighties,
		#embers, flat, google, grayscale, greenscreen, harmonic16, isotope, londontube,
		#marrakesh, mocha, monokai, ocean, paraiso, pop (dark only), railscasts, shapesifter,
		#solarized, summerfruit, tomorrow, twilight
		#theme="eighties"
		#Possible variants: dark and light
		#shade="dark"
		#BASE16_SHELL="/usr/share/zsh/scripts/base16-shell/base16-$theme.$shade.sh"
		#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
		# Use autosuggestion
		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
  	fi
    ;;
  *)
  	if $(ps -p$PPID| grep -q -e konsole -e qterminal); then
    	RPROMPT='$(git_prompt_string)'
    else
        RPROMPT='$(git_prompt_string)'
		# Use autosuggestion
		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
  	fi
    ;;
esac

# Auto-ls when cd
chpwd() {
  ls
}

# vim line editing
# bindkey -v
# faster mode change
export KEYTIMEOUT=1

# C-X,C-E to edit command in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# extract archives
extract(){
   if [[ -z "$1" ]] ; then
       print -P "usage: \e[1;36mextract\e[1;0m < filename >"
       print -P "       Extract the file specified based on the extension"
   elif [[ -f $1 ]] ; then
       case ${(L)1} in
           *.tar.xz)   tar -Jxf $1     ;;
           *.tar.bz2)  tar -jxvf $1    ;;
           *.tar.gz)   tar -zxvf $1    ;;
           *.bz2)      bunzip2 $1       ;;
           *.gz)       gunzip $1       ;;
           *.jar)      unzip $1       ;;
           *.rar)      unrar x $1       ;;
           *.tar)      tar -xvf $1       ;;
           *.tbz2)     tar -jxvf $1    ;;
           *.tgz)      tar -zxvf $1    ;;
           *.zip)      unzip $1          ;;
           *.Z)        uncompress $1    ;;
           *.7z)       7za e $1     ;;
           *)          echo "Unable to extract '$1' :: Unknown extension"
       esac
   else
       echo "File ('$1') does not exist!"
   fi
}


# .scripts to PATH
# PATH=/home/omnihil/.scripts/:$PATH

# dynamic colors colorchange urxvt
#export PATH="$HOME/.dynamic-colors/bin:$PATH"
# source $HOME/.dynamic-colors/completions/dynamic-colors.zsh

# TERMCMD to path for starting ranger etc in urxvt
# export TERMCMD=urxvt
# export TERMCMD=xst
# TERM=xst

# athame-git
unset zle_bracketed_paste
# export ATHAME_ENABLED=1

# fzf fuzzy finder
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

bindkey '^[[1;5C' emacs-forward-word
bindkey '^[^[[D' emacs-backward-word

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


######################################################
# Upload alias "transfer FILE" auf https://transfer.sh
# transfer() {
#     wget -t 1 -qO - --method=PUT --body-file="$1" --header="Content-Type: $(file -b --mime-type "$1")" https://transfer.sh/$(basename "$1");
#     echo
# }

# alias transfer=transfer

# # oder transfer.sh mit curl:
# transfer() {
#     curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null;
#     echo
# }

# alias transfer=transfer

#####################################################


# ZPLUG
# source ~/.zplug/init.zsh

# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "zsh-users/zsh-completions"
# zplug "b4b4r07/enhancd", use:init.sh
# zplug "zsh-users/zsh-history-substring-search"
# zplug "aperezdc/zsh-fzy"
# zplug "gporrata/bklyn-zsh", as:theme
#

# Title / tab title
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn '\e]2;%n@%m %1~\a'
}

function xterm_title_preexec () {
	print -Pn '\e]2;%n@%m %1~ %# '
	print -n "${(q)1}\a"
}

# if [[ "$TERM" == (screen*|xterm*|rxvt*) ]]; then
# 	add-zsh-hook -Uz precmd xterm_title_precmd
# 	add-zsh-hook -Uz preexec xterm_title_preexec
# fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# NNN plugins:
export NNN_PLUG='i:mediainf;o:fzy-open;p:mocplay;d:ndiff;m:nmount;t:thumb'

# set directory for VST music plugins
VST_PATH=~/.vst
export VST_PATH

