#!/bin/bash
file="@GLF-path@/challenge.jsonc"
os=$(grep ^ID= /etc/os-release | cut -d "=" -f 2 | tr -d \")
old_icon=$(grep key @GLF-path@/challenge.jsonc | head -n 1 | cut -d ":" -f2 | tr -d \", | awk '{$1=$1};1')
old_color=$(grep keyColor @GLF-path@/challenge.jsonc | head -n 1 | cut -d ":" -f2 | tr -d \", | awk '{$1=$1};1')

case "$os" in
  "arch")
    new_icon="󰣇"
    new_color="bright_blue" ;;
  "endeavouros")
    new_icon=""
    new_color="bright_magenta" ;;
  "manjaro")
    new_icon="󱘊"
    new_color="bright_green" ;;
  "debian")
    new_icon="󰣚"
    new_color="bright_red" ;;
  "ubuntu")
    new_icon="󰕈"
    new_color="red" ;;
  "fedora")
    new_icon="󰣛"
    new_color="blue" ;;
  "opensuse")
    new_icon=""
    new_color="green" ;;
  "gentoo")
    new_icon=""
    new_color="magenta" ;;
  "nixos")
    new_icon=""
    new_color="bright_blue"
  *)
    new_icon="󰣇"
    new_color="bright_blue" ;;
esac

if [[ -n "$new_icon" ]]; then
  sed -zi -e "s/$old_icon/$new_icon/" -e "s/$old_color/$new_color/" "$file"
fi
