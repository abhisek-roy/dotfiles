# Setup fzf
# ---------
if [[ ! "$PATH" == */home/aroy/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/aroy/.fzf/bin"
fi

source <(fzf --zsh)
