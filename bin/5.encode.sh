CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

tar cvzf $GCS_WORK/couriass.tar.gz $GCS_WORK/*.txt 
git -C $GCS_REPO pull

