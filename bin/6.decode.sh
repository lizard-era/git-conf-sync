CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

(cd $GCS_WORK ; gpg --homedir $GCS_GNUPGHOME --decrypt $GCS_REPO/curiass.gpg | tar xvz)

