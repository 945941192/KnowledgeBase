#!/bin/bash

LOGDATE=$(date "+%Y-%m-%d-%H-%M-%S")
GitProjectDir=$(pwd)
GitLogFile="${GitProjectDir}/git_log"

cd ${GitProjectDir} 
res=$(git status | grep "modified" | wc -l)  
[ ${res} -eq 0 ] && echo "${LOGDATE}------> Nothing need to commit" && exit 88
git status >> ${GitLogFile} && git add -A && git commit -m "add something"
[ $? -eq 0 ] && echo "${LOGDATE}------->commit ok" >> ${GitLogFile} 
