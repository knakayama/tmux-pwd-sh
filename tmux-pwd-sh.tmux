#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${CURRENT_DIR}/scripts/helpers.sh"

readonly pwd_sh_key="$(get_tmux_option "@pwd-sh-key" "P")"

tmux bind-key "$pwd_sh_key" \
  command-prompt -p "Enter password:" \
  "run-shell '${CURRENT_DIR}/scripts/pwd-sh.sh %%'"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
