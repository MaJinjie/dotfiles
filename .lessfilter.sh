#! /usr/bin/env bash

typeset mime category kind ext

has_cmd() {
	for opt in "$@"; do
		if command -v "$opt" >/dev/null; then
			continue
		else
			return $?
		fi
	done
}

mime=$(file -Lbs --mime-type "$1")
category=${mime%%/*}
kind=${mime##*/}
ext=${1##*.}

if [[ "$kind" = json ]]; then
	if has_cmd jq; then
		jq -Cr . "$1"
	else
		false
	fi
elif [[ -d "$1" ]]; then
	if has_cmd eza; then
		eza -TF --color=always --icons "$1"
	else
		false
	fi
fi || lesspipe.sh "$1"
