CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

(cd $GCS_WORK;tar cvzf $GCS_WORK/couriass.tar.gz *.txt) 
git -C $GCS_REPO pull

for key in $GCS_REPO/keyring/*.gpg
do
	gpg --armor --homedir $GCS_GNUPGHOME --import $key
done

keys=`gpg --homedir $GCS_GNUPGHOME --list-keys | grep ^pub | cut -d/ -f2 | cut -d\  -f1`

# Compose recipients args
recipients=""
for key in $keys
do
	recipients="$recipients -R $key"
done

gpg --homedir $GCS_GNUPGHOME $recipients --trust-model always --output $GCS_WORK/couriass.gpg --encrypt $GCS_WORK/couriass.tar.gz 
