# Generated by Django 3.2.14 on 2022-11-08 06:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0024_auto_20221108_1042'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order_main',
            name='date',
            field=models.DateField(default=0, max_length=50),
        ),
    ]
