#!/bin/bash
set -e

_current_os() {
  case "$(uname -s)" in
  Darwin)
    os=darwin
    gui=true
    ;;
  *)
    echo "OS Not Supported"
    exit 1
    ;;
  esac
}
_current_os

echo "Install Required Tooling..."
source install/pre.${os}.sh

for file in install/app/*; do
  case "$(basename $file)" in
  terminal.sh)
    if $gui; then
      source $file
    fi
    ;;
  *)
    source $file
    os_app_name="app_name_$os"
    app_name=${!os_app_name}
    if [[ ! -z $app_name ]]; then
      _install "$title" $app_name
    fi

    [[ ! -z $config_name ]] && _configure $config_name
    ;;
  esac
done
