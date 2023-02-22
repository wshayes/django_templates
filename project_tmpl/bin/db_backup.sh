#!/bin/bash
# From https://mattsegal.dev/postgres-backup-automate.html

# Backs up mydatabase to a file and then uploads it to AWS S3.

# First, dump database backup to a file
TIME=$(date "+%s")
BACKUP_FILE="postgres_${PGDATABASE}_${TIME}.pgdump"
echo "Backing up $PGDATABASE to $BACKUP_FILE"
pg_dump --format=custom > $BACKUP_FILE

# Second, copy file to AWS S3
S3_BUCKET=s3://mydatabase-backups
S3_TARGET=$S3_BUCKET/$BACKUP_FILE
echo "Copying $BACKUP_FILE to $S3_TARGET"
aws s3 cp $BACKUP_FILE $S3_TARGET

echo "Backup completed for $PGDATABASE"
