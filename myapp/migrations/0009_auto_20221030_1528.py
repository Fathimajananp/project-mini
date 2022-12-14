# Generated by Django 3.1.4 on 2022-10-30 09:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0008_remove_order_delivery_date'),
    ]

    operations = [
        migrations.CreateModel(
            name='bank',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('accountnumber', models.CharField(max_length=40)),
                ('cvv', models.CharField(max_length=40)),
                ('amount', models.IntegerField()),
            ],
        ),
        migrations.RemoveField(
            model_name='payment',
            name='amount',
        ),
        migrations.RemoveField(
            model_name='payment',
            name='mode_of_payment',
        ),
    ]
