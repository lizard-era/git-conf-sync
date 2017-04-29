CONF_FILE=./etc/git-conf-sync.cfg
. $CONF_FILE

if [ ! -d $GCS_GNUPGHOME ]
then
	mkdir -p $GCS_GNUPGHOME
	chmod 700 $GCS_GNUPGHOME
fi

if [ ! -f $GCS_GNUPGHOME/random_seed ]
then
	dd if=/dev/urandom of=$GCS_GNUPGHOME/random_seed count=1 bs=600
	chmod 600 $GCS_GNUPGHOME/random_seed
fi

if [ ! -f $GCS_GNUPGHOME/secring.gpg ]
then
	gpg --batch --homedir $GCS_GNUPGHOME --gen-key <<EOF
	Key-Type: DSA
	Key-Length: 3072
	Subkey-Type: ELG-E
	Subkey-Length: 3072
	Name-Real: Lizard Era
	Name-Comment: CUIRASS-ID-$GCS_HOST_ID
	Name-Email: lizard.era@gmail.com
	Expire-Date: 0
	%no-protection
	%commit
	%echo done
EOF
fi


if [ ! -d $GCS_REPO ]
then
	git clone $GCS_STORE $GCS_REPO
fi

git -C $GCS_REPO pull
gpg --armor --homedir $GCS_GNUPGHOME --export lizard.era@gmail.com > $GCS_REPO/keyring/$GCS_HOST_ID.gpg
git -C $GCS_REPO pull
git -C $GCS_REPO add $GCS_REPO/keyring/$GCS_HOST_ID.gpg
git -C $GCS_REPO commit -m "Add $GCS_HOST_ID public key"
git -C $GCS_REPO push
