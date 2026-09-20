# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

source /home/elizalde/Downloads/vulkansdk-linux-x86_64-1.4.350.1/1.4.350.1/setup-env.sh --set-dep-ld > /dev/null

alias qrenderdoc="WAYLAND_DISPLAY= QT_QPA_PLATFORM=xcb qrenderdoc"

#Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir(){
    fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

alias ls="eza --color=always --long --git --all"

# opencode
export PATH=/home/elizalde/.opencode/bin:$PATH
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
