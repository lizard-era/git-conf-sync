CONF_FILE=/opt/git-conf-sync/etc/git-conf-sync.cfg
. $CONF_FILE

grep -v ":\*:\|:\!:" < $GCS_SHADOW > $GCS_REPO/passwords
