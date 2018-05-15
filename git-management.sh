#!/bin/bash

LOGDATE=$(date "+%Y-%m-%d-%H-%M-%S")
GitProjectDir=$(cd `dirname $0`; pwd)
echo ${GitProjectDir}
GitLogFile="${GitProjectDir}/git_log"

cd ${GitProjectDir} 
res=$(git status | grep "modified" | wc -l)  
[ ${res} -eq 0 ] && echo "${LOGDATE}------> Nothing need to commit" | tee ${GitLogFile} && exit 88
git status >> ${GitLogFile} && git add -A && git commit -m "add something" && git push origin master:wzb
[ $? -eq 0 ] && echo "${LOGDATE}------->commit ok" | tee ${GitLogFile}
