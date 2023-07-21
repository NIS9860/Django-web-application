FROM python:3

WORKDIR /app/web-app-django

COPY ./requirements.txt /app/web-app-django

RUN pip install -r requirements.txt

COPY . /app/web-app-django

RUN python manage.py migrate

EXPOSE 8000

CMD python /app/web-app-django/todo/manage.py runserver 0.0.0.0:8000



