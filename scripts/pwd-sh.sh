#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${CURRENT_DIR}/helpers.sh"

for cmd in "pwd.sh" "peco" "pbcopy"; do
  if ! exist "$cmd"; then
    display_msg "$cmd does not found in your PATH."
    return 1
  fi
done

readonly pwd_sh_size="$(get_tmux_option "@pwd-sh-size" "7")"
readonly pass="$1"

tmux split-window -l $pwd_sh_size "echo $pass \
  | pwd.sh r all \
  | awk '{print \$2}' \
  | peco \
  | pwd.sh r <<(echo $pass) \
  | awk 'NR == 3 {print \$1}' \
  | pbcopy"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
