set -e

title=NeoVim
app_name_darwin=neovim
config_name=nvim

_select_app() {
  APP=$(gum choose "LunarVim" "LazyVim" --header "Select Neovim Framework :")
  case "$APP" in
  LunarVim)
    if ! _is_cmd_installed lvim; then
      bash -c "$(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)"
    fi
    export config_name=lvim
    NVIM_CWD=$(pwd)
    cd lvim/dot-config/lvim/lua/user
    rm -rf plugins
    ln -s $NVIM_CWD/nvimcommon/plugins plugins
    cd -
    ;;
  LazyVim)
    if [[ ! -d nvimcommon/starter ]]; then
      git clone https://github.com/LazyVim/starter nvimcommon/starter
    fi
    NVIM_CWD=$(pwd)
    cd nvimcommon/starter
    git pull origin $(git branch --show-current)
    cd -
    cd nvim/dot-config/nvim
    rm -rf init.lua
    rm -rf lua/config/lazy.lua
    rm -rf lua/config
    rm -rf lua/plugins
    ln -s $NVIM_CWD/nvimcommon/init.lua init.lua
    ln -s $NVIM_CWD/nvimcommon/config lua/config
    ln -s $NVIM_CWD/nvimcommon/starter/lua/config/lazy.lua lua/config/lazy.lua
    ln -s $NVIM_CWD/nvimcommon/plugins lua/plugins
    cd -
    ;;
  *)
    gum confirm "Choose Neovim App?" && _select_app
    ;;
  esac
}
_select_app
