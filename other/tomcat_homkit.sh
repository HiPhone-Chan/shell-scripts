#!/usr/bin/sh

dwar='war/path'
baseDir='tomcat/path'

function deploy(){
   cp ${dwar} ${baseDir}/webapps/ROOT.war
   rm -rf ${baseDir}/webapps/ROOT
   rm -rf ${baseDir}/work/
   rm -rf ${baseDir}/tmp/
   sh  ${baseDir}/bin/startup.sh
   tail -f ${baseDir}/logs/catalina.out
}

function start(){
   sh ${baseDir}/bin/startup.sh
   tail -f ${baseDir}/logs/catalina.out
}

function stop(){
   kill -9 `ps -ef|grep ${baseDir}|grep -v grep|awk '{print $2}'`
   ps -ef |grep tomcat
}


echo ${dwar}
case $1 in
  start)
    start
  ;;
  stop)
    stop
  ;;
  deploy)
    deploy
  ;;
  *)
    echo 'other ...'
    ps -ef |grep ${baseDir}
esac
