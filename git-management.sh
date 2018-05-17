#!/bin/bash
# 30 6 * * * /bin/bash /Users/weizhanbiao/Desktop/KnowledgeBase/git-management.sh

LOGDATE=$(date "+%Y-%m-%d-%H-%M-%S")
GitProjectDir=$(cd `dirname $0`; pwd)
echo ${GitProjectDir}
GitLogFile="${GitProjectDir}/git_log"

git_operation()
{
    cd ${GitProjectDir} 
    res=$(git status | grep "modified" | wc -l)  
    echo "res=${res}"
    git_log_status=$(git status | grep "modified:   git_log" | wc -l) #只是改变了git_log   
    echo "status=${git_log_status}"
    [ ${res} -eq ${git_log_status} ] && echo "${LOGDATE}------> Nothing need to commit" | tee -a ${GitLogFile} && exit 88
    git status >> ${GitLogFile} && git add -A && git commit -m "add something" && git push origin wzb:wzb && echo "${LOGDATE}------->commit ok" | tee -a ${GitLogFile}
}

git_operation
