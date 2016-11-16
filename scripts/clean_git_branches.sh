#!/bin/bash

set -e

WHITELIST="(HEAD|master|develop)"
SAFETY_ON=true

main() {
  for branch in `removable_merged_remote_branches` ; do
    show_message
    delete_remote_branch
  done
}

removable_merged_remote_branches() {
  git branch --remote --merged |
  grep -Ev "$WHITELIST" |
  sed "s#$(git_remote_name)/##"
}

git_remote_name() {
  git remote | head -n 1
}

branch_age() {
  git show -s --format="%ar" "$(git_remote_name)/$branch"
}

show_message() {
  if $SAFETY_ON ; then
    verb="Would delete"
  else
    verb="Deleting"
  fi
  echo "$verb $branch from" `branch_age`
}

delete_remote_branch() {
  if $SAFETY_ON ; then
    :
  else
    git push "$(git_remote_name)" :$branch
  fi
}

main
