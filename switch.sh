#!/bin/zsh
git -C /etc/nixos add --all
if [[ $(git -C /etc/nixos diff -U0) ]] then
  msg=$(git -C /etc/nixos diff -U0 || "No changes")
else
  msg="No changes"
fi
sudo nixos-rebuild switch --impure && git -C /etc/nixos commit -m "$msg"
