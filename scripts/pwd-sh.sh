#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${CURRENT_DIR}/helpers.sh"

readonly pwd_sh_size="$(get_tmux_option "@pwd-sh-size" "7")"
readonly pass="$1"

for cmd in "pwd.sh" "peco" "pbcopy"; do
  if ! exist "$cmd"; then
    display_msg "$cmd does not found in your PATH."
    return 1
  fi
done

tmux split-window -l $pwd_sh_size "pwd.sh r all \
  | grep -vE '^($|Done)' \
  | peco \
  | awk '{print \$1}' \
  | pbcopy"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
