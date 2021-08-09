# Generated by Django 3.0.5 on 2020-08-19 06:04

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('user', '0006_auto_20200818_1636'),
    ]

    operations = [
        migrations.AlterField(
            model_name='trainer',
            name='date',
            field=models.DateTimeField(blank=True, default=django.utils.timezone.now, null=True, verbose_name='Registered Date'),
        ),
        migrations.AlterField(
            model_name='trainer',
            name='trainer_name',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Trainer Name'),
        ),
    ]
