#!/bin/bash

# Outputs markdown. Preview in IDE and copy to email.
# Prereqs: awscli, jq

EXPIRY=604800  # in SECONDS
BUCKET=$1

OUTFILE=$BUCKET-signed-urls.md
echo "" > $OUTFILE
IFS=$'\n'

if [[ -z $BUCKET ]]; then echo "Specify bucket name, either via \$BUCKET var or via \$1 argument."; exit 1; fi

MINUTES=$(expr $EXPIRY / 60)
HOURS=$(expr $EXPIRY / 60 / 60)
DAYS=$(expr $EXPIRY / 60 / 60 / 24)

echo -e "# Presigned URLs for all objects in bucket: $BUCKET\n\n*Validity of $EXPIRY seconds ($MINUTES mins / $HOURS hours / $DAYS days) from $(date)*\n" >> $OUTFILE
for i in $(aws s3api list-objects --bucket $BUCKET | jq '.Contents[].Key' -r | grep -v DS_Store); do
    echo -e "- [${i}]($(aws s3 presign --expires-in ${EXPIRY} "s3://${BUCKET}/${i}"))" >> $OUTFILE
done

cat $OUTFILE
unset IFS
