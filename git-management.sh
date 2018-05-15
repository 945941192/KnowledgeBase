#!/bin/bash
LOGDATE=$(date "+%Y-%m-%d-%H-%M-%S")
GitProjectDir=$(pwd)
cd ${GitProjectDir} && git status >> git_log && git add -A && git commit -m "add something"
[ $? -eq 0 ] && echo "${LOGDATE}------->commit ok"
