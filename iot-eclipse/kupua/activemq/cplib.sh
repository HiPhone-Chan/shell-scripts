MQ_PATH=KAPUA git PATH
MQCONF_PATH=activemq PATH

echo 'deleting different guava/shiro runtime dependency'
rm $MQ_PATH/lib/optional/guava-*
rm $MQ_PATH/lib/optional/shiro-*

echo 'deleting old Kapua runtime dependency'
find $MQ_PATH/lib/extra ! -name 'mqtt-client*.jar' -type f -exec rm -f {} +

echo 'copying...'
cp $MQCONF_PATH/lib/extra/* $MQ_PATH/lib/extra
cp $MQCONF_PATH/conf/* $MQ_PATH/conf

echo 'finish...'