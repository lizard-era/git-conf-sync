CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

if [ ! -d $GCS_REPO ]
then
	git clone $GCS_STORE $GCS_REPO
fi

cd $GCS_REPO
git pull
