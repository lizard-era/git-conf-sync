CONF_FILE=/opt/git-conf-sync/etc/git-conf-sync.cfg
. $CONF_FILE
echo $GCS_STORE

if [ ! -d $GCS_REPO ]
then
	git clone $GCS_STORE $GCS_REPO
fi

cd $GCS_REPO
git pull
