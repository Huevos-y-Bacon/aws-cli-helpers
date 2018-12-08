#!/bin/bash
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ ${machine} == 'Mac' ];
	then BIN="/usr/local/bin"
else
	BIN=$(systemd-path user-binaries)
fi

echo "You're running on ${machine} - Copying the following files to $BIN:"
for A in $(find . -type f -name aws\*); do echo $A; cp $A $BIN/;done
for O in $(find . -type f -name okta\*); do echo $O; cp $O $BIN/;done
