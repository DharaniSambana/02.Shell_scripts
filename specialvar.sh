#!/bin/bash

echo "all avariable passed to the script: $@ "

echo "no of variables passed to scripts: $#"

echo "script name: $0"

echo "current working directly: $PWD"

echo "home directory of current user: $HOME"

echo "PID of the script executing now : $$"

sleep 50 &

echo "PID of last background command: $!"