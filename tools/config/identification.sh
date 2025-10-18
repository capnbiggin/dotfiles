#!/usr/bin/env bash

export GIT_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export GIT_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

# Set identification from install inputs for git
if [[ -n "${GIT_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$GIT_USER_NAME"
fi

if [[ -n "${GIT_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$GIT_USER_EMAIL"
fi
