#!/bin/bash
# Resets the local Django database, adding an admin login and migrations
# From https://mattsegal.dev/restore-django-local-database.html

set -e
echo -e "\n>>> Resetting the database"

./manage.py reset_db --close-sessions --noinput

# =========================================
# DOWNLOAD AND RESTORE DATABASE BACKUP HERE
# =========================================

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

echo -e "\n>>> Database reset finished."
