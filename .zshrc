# Source config file if it exists
sourceMaybe() { if [ -f $1 ]; then source $1; else; fi }

eval $(dircolors $ZDOTDIR/colors/dircolors.wombat)

source $ZDOTDIR/config/general.zshrc
source $ZDOTDIR/config/alias.zshrc
source $ZDOTDIR/config/path.zshrc
source $ZDOTDIR/config/env.zshrc

sourceMaybe $ZDOTDIR/plugin/work.zshrc
