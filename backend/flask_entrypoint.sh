#!/bin/sh

# Collect static files
#echo "Collect static files"
#python3 manage.py collectstatic --noinput

echo "Making database migrations"
#python3 manage.py makemigrations

echo "Apply database migrations"
#python3 manage.py migrate

# Start server
echo "Starting server"
#python3 -u manage.py runserver 0.0.0.0:8000