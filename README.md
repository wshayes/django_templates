# Django Project Template

## Must have Django packages

- django-debug-toolbar - this will show you a toolbar on the side of the page with useful information
- django-browser-reload - this will reload the browser when you change a template file
- django-extensions - provides runserver_plus (allows for local https) and other useful management commands

## Nice to have Django packages

- django-widget-tweaks - this will allow you to add classes to form fields
- Django Ninja - FastAPI-like Rest Framework for Django
- Django Import Export - Allows you to import/export data via Excel, CSV, JSON, YAML via the Admin interface
- Django Tenants
- Django Filter - simplifies filtering models via Forms and the Django Rest Framework (what about Ninja?)
- Django Allauth - used for local and social authentication
- Django GUID - supports matching log messages with the HTTP request - adds a Trace ID to all HTTP-related logs
- Celery/Celery Beat - background processing, Beat provides periodic tasks scheduler for Celery
- [Django Baton|https://django-baton.readthedocs.io/en/latest/] - Admin Web Interface enhancer - A cool, modern and responsive django admin application based on bootstrap 5
- [Django Cookie Cutter|https://cookiecutter-django.readthedocs.io/en/latest/index.html]

## Third party packages

- alpine.js - this is a javascript framework that allows you to add interactivity to your site without writing javascript or using jQuery
- htmx - htmx gives you access to AJAX, CSS Transitions, WebSockets and Server Sent Events directly in HTML, using attributes, so you can build modern user interfaces with the simplicity and power of hypertext
- tailwindcss - this is a utility first CSS framework
- Bootstrap5 (used by Django Baton)
- MDBootstrap
- Sentry/Datadog

## Notes

- You can create some data and then run `python manage.py dumpdata > data.json` to create a fixture file. You can then load this data into a new database with `python manage.py loaddata data.json`
- You can create a superuser with `python manage.py createsuperuser`
- You can run the tests with `python manage.py test`
- You can run the server with `python manage.py runserver`

## Setup new project

See NEW_PROJECT.md file


## Example projects

- Great examples here - this one of several dozen is focused on using Django, HTMX, Alpine and Tailwind together and has lot of neat tips: https://github.com/katanaml/sample-apps/tree/master/20/django-htmx-sandbox
- Django Registration System for DCCN conference - https://github.com/dccnconf/dccnsys

