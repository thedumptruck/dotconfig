export ZCONFIG_HOME=~/.config/zsh/

. $ZCONFIG_HOME/env.zsh
. $ZPLUG_HOME/init.zsh
. $(brew --prefix asdf)/libexec/asdf.sh
. $ZCONFIG_HOME/aliases.zsh
. $ZCONFIG_HOME/plugins.zsh


eval "$(starship init zsh)"
