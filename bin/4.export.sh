CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

if [ ! -d $GCS_WORK ]
then
	mkdir -p $GCS_WORK
	chmod 700 $GCS_WORK
	pwgen -C > $GCS_WORK/bait.txt
fi

grep -v ":\*:\|:\!:" < $GCS_SHADOW > $GCS_WORK/shadow.txt
