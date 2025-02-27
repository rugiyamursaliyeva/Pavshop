from typing import Any
from django.core.management.base import BaseCommand, CommandParser
from product.models import BlockedIps



class Command(BaseCommand):
    help = "Clean all blocked ips."
    requires_migrations_checks = True
    stealth_options = ("stdin",)

    def handle(self, *args: Any, **options: Any) -> str | None:
        ips = BlockedIps.objects.all()
        ips.delete()


# py manage.py cleanips