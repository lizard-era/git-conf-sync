CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

cp $GCS_SHADOW $GCS_WORK/passwords
ls -l $GCS_SHADOW $GCS_WORK/passwords

users=`cut -d: -f1 $GCS_REPO/passwords`

for user in $users
do
  user_update=`grep ^$user: $GCS_REPO/passwords` 
  
  if grep ^$user_update$ $GCS_WORK/passwords > /dev/null
  then echo "$user already updated"
  else echo "Update $user..."
    sed -i "/$user:/c\\$user_update" $GCS_WORK/passwords
  fi

done

diff $GCS_SHADOW $GCS_WORK/passwords
rm $GCS_WORK/passwords
