# Generated by Django 5.0.6 on 2024-10-16 16:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0007_brand_slug'),
    ]

    operations = [
        migrations.CreateModel(
            name='BlockedIps',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('ip_address', models.GenericIPAddressField(verbose_name='ip_address')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AlterField(
            model_name='brand',
            name='slug',
            field=models.SlugField(unique=True, verbose_name='slug'),
        ),
    ]
