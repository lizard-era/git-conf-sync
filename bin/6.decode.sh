CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

gpg --homedir $GCS_GNUPGHOME --decrypt $GCS_REPO/curiass.gpg | (cd $GCS_WORK; tar xvz)

