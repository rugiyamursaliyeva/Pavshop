# Generated by Django 5.0.6 on 2024-09-10 15:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_oursponsors'),
    ]

    operations = [
        migrations.CreateModel(
            name='CultureImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='images/')),
            ],
        ),
    ]
