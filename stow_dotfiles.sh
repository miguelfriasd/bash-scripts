#!/bin/bash
GIT_REPO=git@github.com:miguelfriasd/Dotfiles.git
DIRECTORY=~/Dotfiles/

#Make the directory if it doesn't exist.
#https://stackoverflow.com/a/59839
if [ ! -d "$DIRECTORY" ]; then
	mkdir "$DIRECTORY" -p
fi

#Clone the repository if it the directory is empty.
#https://superuser.com/a/352290
if [ -z "$(ls -A "$DIRECTORY")" ]; then
	git clone "$GIT_REPO" "$DIRECTORY"
fi

#Install stow if no installed.
#https://stackoverflow.com/a/22592801
if [ "$(dpkg-query -W -f='${Status}' stow 2>/dev/null | grep -c "ok installed")" -eq 0 ]; then
	apt-get install stow
fi

#Change current director, to stow the files wihtin it.
cd "$DIRECTORY" || exit

for file in *; do
	if [ -d "$file" ]; then # Only process files, not directories
		echo "Stowing $file"
		stow "$file"
	fi
done

echo "Done!"
