## 1. Install Django

```
pip install django
```

Install dependencies:

```
pip install django-widget-tweaks
```

```
pip install django-browser-reload
```

#### Steps 2 - 5 are not required. These steps are needed if you would create app from scratch. Run application in Step 6

## 2. Create project

```
django-admin startproject project_name .
```

## 3. Create application

In simple terms, app_name should have short, all-lowercase names. Underscores can be used in the module name if it improves readability. also should have a short name and it can be a plural and singular name. Example names: users, order, polls, rest_framework, geodjango, cms.

```
python manage.py startapp app_name
```

## 4. Run Django migrations (build Django ORM)

```
python manage.py makemigrations
```

```
python manage.py migrate
```

## 5. Create Django superuser (not required)

```
python manage.py createsuperuser
```

Add new data entries through Django Admin console

## 6. Run application

```
python manage.py runserver
```

## 7. Dump/load data (not required)

```
python manage.py dumpdata app_name  > db.app_name.json --indent 4
```

```
python manage.py loaddata db.app_name.json
```
