# Database mgmt notes



## Reseting local DB with prod data

From https://mattsegal.dev/restore-django-local-database.html

### Fetching latest database backup file from S3

Finding it
```bash
S3_BUCKET=s3://mydatabase-backups
LATEST_FILE=$(aws s3 ls $S3_BUCKET | awk '{print $4}' | sort | tail -n 1)
echo -e "\nFound file $LATEST_FILE in bucket $S3_BUCKET"
```

Downloading the file

```bash
aws s3 cp ${S3_BUCKET}/${LATEST_FILE} .
```

### Restoring the database

```bash
pg_restore \
    --clean \
    --dbname postgres \
    --host localhost \
    --port 5432 \
    --username postgres \
    --no-owner \
    $LATEST_FILE
```

### Restoring the database from S3 without downloading the file

```bash
aws s3 cp ${S3_BUCKET}/${LATEST_FILE} - | \
    pg_restore \
        --clean \
        --dbname postgres \
        --host localhost \
        --port 5432 \
        --username postgres \
        --no-owner
```
