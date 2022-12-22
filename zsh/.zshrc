# ZSH Configuration #
# ================= #

## ZSH Completion ##
autoload -Uz compinit
compinit
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
setopt correct

## Install poetry and enable completions ##
if [[ ! -f ~/.oh-my-zsh/custom/plugins/poetry/_poetry ]]; then
    curl -sSL https://install.python-poetry.org | python3 -
    mkdir -p ~/.oh-my-zsh/custom/plugins/poetry
    /home/radeox/.local/bin/poetry completions zsh > ~/.oh-my-zsh/custom/plugins/poetry/_poetry
fi

## Fish syntax ##
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Git extras ##
source /usr/share/doc/git-extras/git-extras-completion.zsh

## Plugins ##
plugins=(autojump docker docker-compose pip python poetry sudo vscode)

# Key bindings #
# ============ #

## Create a zkbd compatible hash ##
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

## Setup keys ##
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete
[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Oh-My-ZSH
export ZSH="/home/radeox/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# My aliases
source ~/.aliases

## Environmental variables ##
export TERM="xterm-256color"
export EDITOR="/usr/bin/nvim"
export SUDO_EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

### Flutter stuff ###
export PATH="$PATH:/opt/Android-SDK"
export ANDROID_SDK_ROOT="/opt/Android-SDK"
export CHROME_EXECUTABLE="/usr/bin/vivaldi-stable"

# Python stuff
export PATH="/home/radeox/.local/bin:$PATH"

# Starship
eval "$(starship init zsh)"
