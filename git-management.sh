#!/bin/bash
# 30 6 * * * /bin/bash /Users/weizhanbiao/Desktop/KnowledgeBase/git-management.sh

LOGDATE=$(date "+%Y-%m-%d-%H-%M-%S")
GitProjectDir=$(cd `dirname $0`; pwd)
echo ${GitProjectDir}
GitLogFile="${GitProjectDir}/commit.log"

git_operation()
{
    cd ${GitProjectDir} 
    res=$(git status | grep "nothing to commit, working tree clean" | wc -l)  
    echo "res=${res}"
    [ ${res} -eq 1 ] && echo "${LOGDATE}------> Nothing need to commit" | tee -a ${GitLogFile} && exit 88
    git status >> ${GitLogFile} && git add -A && git commit -m "add something" && git push origin wzb:wzb && echo "${LOGDATE}------->commit ok" | tee -a ${GitLogFile}
}

git_operation
