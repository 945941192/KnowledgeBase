#!/bin/bash

LOGDATE=$(date "+%Y-%m-%d-%H-%M-%S")
GitProjectDir=$(cd `dirname $0`; pwd)
echo ${GitProjectDir}
GitLogFile="${GitProjectDir}/git_log"

cd ${GitProjectDir} 
res=$(git status | grep "modified" | wc -l)  
git_log_status=$(git status | grep "modified   git_log" | wc -l) #只是改变了git_log   
[ ${res} -eq ${git_log_status} ] && echo "${LOGDATE}------> Nothing need to commit" | tee -a ${GitLogFile} && exit 88
git status >> ${GitLogFile} && git add -A && git commit -m "add something" && git push origin wzb:wzb
[ $? -eq 0 ] && echo "${LOGDATE}------->commit ok" | tee -a ${GitLogFile}
