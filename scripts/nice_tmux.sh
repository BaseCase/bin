#!/usr/bin/env bash
set -e

new_session_sentinel="Start New Session"

main() {
  if [ `count_open_tmux_sessions` -gt "0" ] ; then
    choice=`present_session_list`
    attach_to_chosen_session "$choice"
  else
    tmux
  fi
}

count_open_tmux_sessions() {
  tmux ls 2>/dev/null | wc -l | awk '{print $1}'
}

present_session_list() {
  printf "$new_session_sentinel\n$(tmux ls)" | fzf --height 40%
}

attach_to_chosen_session() {
  choice="$1"

  if [ "$choice" == "$new_session_sentinel" ] ; then
    tmux
  else
    tmux attach -t `parse_session_name "$choice"`
  fi
}

parse_session_name() {
  echo "$1" | cut -d ':' -f 1
}

main
