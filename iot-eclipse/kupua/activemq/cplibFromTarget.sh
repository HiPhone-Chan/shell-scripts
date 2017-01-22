KAPUA_PATH=KAPUA git PATH

echo 'copying Kapua runtime dependency'
cp $KAPUA_PATH/assembly/target/broker_dependency/* lib/extra
echo 'copying Kapua arctifact'
cp $KAPUA_PATH/broker-core/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/commons/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/locator/guice/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/message/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/message/internal/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/account/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/account/internal/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/datastore/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/datastore/internal/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/bundle/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/bundle/internal/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/call/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/call/kura/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/command/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/command/internal/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/commons/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/configuration/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/configuration/internal/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/packages/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/packages/internal/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/registry/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/device/registry/internal/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/idgenerator/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/idgenerator/sequence/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/security/authentication/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/security/authorization/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/security/shiro/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/user/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/service/user/internal/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/translator/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/translator/kapua/kura/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/translator/kura/jms/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/translator/kura/mqtt/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/transport/api/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/transport/jms/target/kapua-*.jar lib/extra
cp $KAPUA_PATH/transport/mqtt/target/kapua-*.jar lib/extra
echo 'copying Kapua configuration'
cp $KAPUA_PATH/assembly/src/main/resources/conf/broker/activemq.xml conf/

echo 'remove kapua-dependency'
rm -f kapua-dependency/*

echo 'copy dependencies for broker core'
for name in $(ls $KAPUA_PATH/broker-core/target/dependency/ | grep -Ev 'jaxb-|activemq-|kapua-');
do cp $KAPUA_PATH/broker-core/target/dependency/$name kapua-dependency;
done;

echo 'copy dependencies for locator/guice'
for name in $(ls $KAPUA_PATH/locator/guice/target/dependency/ | grep -Ev 'jaxb-|activemq-|kapua-');
do cp $KAPUA_PATH/locator/guice/target/dependency/$name kapua-dependency; 
done;

echo 'copy kapua modules'
for name in $(find $KAPUA_PATH -name 'kapua-*.jar' | grep target | grep -Ev 'test|console|WEB-INF|dependency|mysql|assembly|dev-tool');
do jar_name=$(echo $name | awk -F"/" '{print $NF}');
   cp $name kapua-dependency/$jar_name;
done;


echo 'finish'