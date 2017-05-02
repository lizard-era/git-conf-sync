CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

cp $GCS_SHADOW $GCS_WORK/passwords

users=`cut -d: -f1 $GCS_WORK/shadow.txt`

for user in $users
do
  user_update=`grep ^$user: $GCS_WORK/shadow.txt` 
  
  if grep ^$user_update$ $GCS_WORK/passwords > /dev/null
  then echo "$user already updated"
  else echo "Update $user..."
    sed -i "/$user:/c\\$user_update" $GCS_WORK/passwords
  fi

done

chmod 640 $GCS_SHADOW $GCS_WORK/passwords
chown root:shadow $GCS_SHADOW $GCS_WORK/passwords
diff -q $GCS_SHADOW $GCS_WORK/passwords > /dev/null || (cp $GCS_SHADOW $GCS_SHADOW.bk ; cp $GCS_WORK/passwords $GCS_SHADOW)


rm $GCS_WORK/passwords
