# Generated by Django 4.0.4 on 2022-06-27 06:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Seguimiento',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.carrito')),
            ],
            options={
                'db_table': 'db_Seguiento',
            },
        ),
        migrations.CreateModel(
            name='EstadoSeguimiento',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.seguimiento')),
            ],
            options={
                'db_table': 'db_EstadoSeguimiento',
            },
        ),
    ]
