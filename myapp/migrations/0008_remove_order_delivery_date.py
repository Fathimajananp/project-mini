# Generated by Django 3.1.4 on 2022-10-30 09:46

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0007_deliverystatus_feedback_order_payment'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='order',
            name='delivery_date',
        ),
    ]