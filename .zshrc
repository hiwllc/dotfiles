export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME='af-magic'

plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.exports
source $HOME/.aliases
source $HOME/.functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
