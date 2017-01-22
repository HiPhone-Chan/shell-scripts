KAPUA_PATH=KAPUA git PATH

echo 'copying Kapua war'
cp $KAPUA_PATH/console/target/console.war .
cp $KAPUA_PATH/rest-api/target/api.war .

echo 'finish'

# kapua-sys
# kapua-password