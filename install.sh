#!/bin/bash

if [[ ! $1 == "-y" ]]; then
	echo -n -e "This will \e[91moverwrite\e[39m your current dotfiles. Do you want to continue? [yN] "
	read -n 1 -r
	echo
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit -1
	fi
fi

for f in .*rc .*.conf .*/*.conf; do
	echo -e "\e[94mInstalling \e[92m${f}\e[39m..."
	
	d=$(dirname "${f}")
	if [[ ${d} != "." ]]; then
		mkdir -p "~/${d}"
	fi
	
	cp "${f}" "~/${f}"
done
