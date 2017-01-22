#!/usr/bin/sh

projectName='xxx'
version='xxx'
logfile='${projectName}.log'

function start(){
    nohup java -jar ${projectName}-${version}-SNAPSHOT.war --spring.profiles.active=prod --server.port=9090 > ${logfile} 2>&1 &
    tail -f ${logfile}
}

function stop(){
   kill -9 `ps -ef|grep 'java -jar'|grep -v grep|awk '{print $2}'`
   ps -ef|grep 'java -jar'
}


echo $1
case $1 in
  start)
    start
  ;;
  stop)
    stop
  ;;
  *)
    ps -ef|grep 'java -jar'
    echo 'other ...'
esac
