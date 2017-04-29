CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

if [ ! -d $GCS_REPO ]
then
	git clone $GCS_STORE $GCS_REPO
fi

git -C $GCS_REPO pull
cp $GCS_WORK/couriass.gpg $GCS_REPO/couriass.gpg
git -C $GCS_REPO add $GCS_REPO/couriass.gpg
git -C $GCS_REPO commit -m "Upload couriass"
git -C $GCS_REPO push
