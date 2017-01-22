MQ_PATH=activemq PATH
MQCONF_PATH=activemq store PATH

echo 'cleanup the symbolic links to Kapua jars'
for name in $(find $MQ_PATH/lib/extra -type l);
do echo remove symbolic link from ./$name;
   rm ./$name;
done;

echo '===> link dependencies'
ln -s $MQCONF_PATH/kapua-dependency/* $MQ_PATH/lib/extra

echo 'finish...'