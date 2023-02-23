# {{ project_name }}


## Getting started

- Install [poetry](https://python-poetry.org/docs/#installation)
- Install [watchman](https://facebook.github.io/watchman/docs/install.html) - this is used to watch for file changes for more efficient reloading of the server (https://adamj.eu/tech/2021/01/20/efficient-reloading-in-djangos-runserver-with-watchman/)
- Start project django project with `django-admin startproject --template=/Users/william.hayes/code/django_templates/project_tmpl --extension=py,md,example,gitignore,toml CHANGEME_PROJECT_NAME`
- Create app with by into `apps` directory next to manage.py and run `django-admin startapp --template=/Users/william.hayes/code/django_templates/app_core_tmpl/app_name --extension=py,md,example,gitignore,toml CHANGEME_APP_NAME`
- Add app to `INSTALLED_APPS` in `settings.py` as 'apps.CHANGEME_APP_NAME'
- Update project `.env` file with correct values for settings.py
- Run poetry install `poetry install`
- Review .pre-commit-config.yaml and update as needed - several components are commented out by default
- Run pre-commit install `pre-commit install`
- Run pre-commit autoupdate `pre-commit autoupdate`
- Run pre-commit run --all-files `pre-commit run --all-files`
- Run django makemigrations `./manage.py makemigrations`
- Run django collectstatic `./manage.py collectstatic`
- Run django migrations `./manage.py migrate`
- Run django createsuperuser `./manage.py createsuperuser`
- Run django runserver `./manage.py runserver`

## Django project structure

See [Figure 1](#figure_1) below for a diagram of the project structure.

Use the command ([cli options](https://docs.djangoproject.com/en/4.1/ref/django-admin/#startapp)) to app templates into your django application:

- `django-admin startapp --template=/Users/william.hayes/code/django_template/app_core_tmpl/app_name --extension=py,md,example,gitignore,toml CHANGEME_APP_NAME`


## Useful commands

  - `./manage.py graph_models -a -g -o my_project_visualized.png` - this will generate a diagram of the models in your project - requires [django-extensions](https://django-extensions.readthedocs.io/en/latest/graph_models.html) and pygraphviz to be installed
    - May need to manually install pygraphviz using pip instead of poetry in order to add locations of graphviz lib and include directory when building the package extensions
`pip install --global-option=build_ext --global-option="-L/opt/homebrew/Cellar/graphviz/7.1.0/lib/" --global-option="-I/opt/homebrew/Cellar/graphviz/7.1.0/include/" pygraphviz`
