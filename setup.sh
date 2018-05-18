#!/bin/bash
BIN=$(systemd-path user-binaries)
echo "Copying the following files to $BIN:"
for A in $(find . -type f -name aws\*); do echo $A; cp $A $BIN/;done
for O in $(find . -type f -name okta\*); do echo $O; cp $O $BIN/;done


