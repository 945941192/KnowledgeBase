#!/bin/bash

LOGDATE=$(date "+%Y-%m-%d-%H-%M-%S")
GitProjectDir=$(pwd)
GitLogFile="${GitProjectDir}/git_log"
cd ${GitProjectDir} && git status >> ${GitLogFile} && git add -A && git commit -m "add something"
[ $? -eq 0 ] && echo "${LOGDATE}------->commit ok" >> ${GitLogFile} 
