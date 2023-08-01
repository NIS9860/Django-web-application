#!/bin/bash

python /d1/d11/todo/manage.py migrate
python /d1/d11/todo/manage.py runserver 0.0.0.0:8000

