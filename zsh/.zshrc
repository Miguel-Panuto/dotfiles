export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.toml)"

# Created by `pipx` on 2024-09-18 16:14:06
export PATH="$PATH:/home/miguel/.local/bin:/home/miguel/geckodriver"
