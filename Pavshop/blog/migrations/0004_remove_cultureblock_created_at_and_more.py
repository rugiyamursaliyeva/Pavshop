# Generated by Django 5.0.6 on 2024-09-10 10:25

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_cultureblock'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='cultureblock',
            name='created_at',
        ),
        migrations.RemoveField(
            model_name='cultureblock',
            name='updated_at',
        ),
    ]
