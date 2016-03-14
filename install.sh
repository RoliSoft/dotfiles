#!/bin/bash

for f in .*rc .*.conf .*/*.conf; do
	if [[ -f ~/${f} ]]; then
		echo -e "\e[34mBacking up \e[93m${f}\e[39m..."
		mv ~/"${f}" ~/"${f}.old"
	fi
	
	echo -e "\e[34mInstalling \e[92m${f}\e[39m..."
	cp "${f}" ~/"${f}"
done