set -e

APP_HOME=$(realpath ~)

_is_cmd_installed() {
  command -v $1 >/dev/null 2>&1
}

_configure() {
  _backup="${APP_HOME}/.config/${1}"
  if [[ -d $_backup || -f $_backup || -L $_backup ]]; then
    mv ~/.config/$1 .orig
  fi

  stow -v -R --dotfiles -t $APP_HOME $1
}
_configure lsd
