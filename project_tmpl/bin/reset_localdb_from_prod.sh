#!/bin/bash
# Resets the local Django database,
# restores from latest prod backup,
# and adds an admin login and migrations
set -e
echo -e "\n>>> Resetting the database"
./manage.py reset_db --close-sessions --noinput

echo -e "\nRestoring database from S3 backups"
S3_BUCKET=s3://mydatabase-backups
LATEST_FILE=$(aws s3 ls $S3_BUCKET | awk '{print $4}' | sort | tail -n 1)
aws s3 cp ${S3_BUCKET}/${LATEST_FILE} - | \
    pg_restore \
        --clean \
        --dbname postgres \
        --host localhost \
        --port 5432 \
        --username postgres \
        --no-owner

echo -e "\n>>> Running migrations"
./manage.py migrate

echo -e "\n>>> Creating new superuser 'admin'"
./manage.py createsuperuser \
   --username admin \
   --email admin@example.com \
   --noinput

echo -e "\n>>> Setting superuser 'admin' password to 12345"
./manage.py shell_plus --quiet-load -c "
u=User.objects.get(username='admin')
u.set_password('12345')
u.save()
"

echo -e "\n>>> Database restore finished."
