# Generated by Django 3.1.4 on 2022-10-30 13:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0011_payment_feedback'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='phone_no',
            new_name='phoneno',
        ),
    ]
