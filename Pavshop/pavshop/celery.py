# django_celery/celery.py

import os
from celery import Celery

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "pavshop.settings")
app = Celery("django_celery")
app.config_from_object("django.conf:settings", namespace="CELERY")
app.autodiscover_tasks()

# py -m celery -A pavshop worker -l info
# celery -A pavshop worker --beat --scheduler django --loglevel=info
