KAPUA_PATH=KAPUA git PATH

echo 'remove Kapua sql'
rm -f create/*.sql
rm -f drop/*.sql
rm -f seed/*.sql
rm -f other/*.sql
rm -f all/*.sql

echo 'copying Kapua sql'
for name in $(find $KAPUA_PATH -name '*.sql' | grep -v test);
do sql_name=$(echo $name | awk -F"/" '{print $NF}');
   case $sql_name in
    *_create.sql)
        cp $name create/
    ;;
    *_drop.sql)
       cp $name drop/
   ;;
   *_seed.sql)
       cp $name seed/
   ;;
   *)
       cp $name other/
    esac
   cp $name all/
done;

echo 'finish'