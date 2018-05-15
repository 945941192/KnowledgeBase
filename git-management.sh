#!/bin/bash
GitProjectDir=$(pwd)
cd ${GitProjectDir} && git status >> git_log && git add -A && git commit -m "add something"
[ $? -eq 0 ] && echo "commit ok"
