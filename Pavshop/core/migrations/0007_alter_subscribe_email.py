# Generated by Django 5.0.6 on 2024-10-03 16:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_cultureimage'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subscribe',
            name='email',
            field=models.EmailField(max_length=200, unique=True, verbose_name='email'),
        ),
    ]
