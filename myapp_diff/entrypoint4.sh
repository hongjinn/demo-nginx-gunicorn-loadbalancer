#!/bin/sh

python myapp/manage.py migrate --no-input
python myapp/manage.py collectstatic --no-input

gunicorn --bind 0.0.0.0:8004 --chdir /myproject/myapp_diff myapp.wsgi:application
