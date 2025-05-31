export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.toml)"

dirs_path="/home/miguel/.local/bin"
dirs_path+=":/home/miguel/geckodriver"
dirs_path+=":/home/miguel/.tmux/plugins/run"
dirs_path+=":/home/miguel/go/bin"
dirs_path+=":/home/miguel/.cargo/env"

# Created by `pipx` on 2024-09-18 16:14:06
export PATH="$PATH:$dirs_path"

# initiate as a tmux session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PGDATA="/home/miguel/.config/postgres/data"
