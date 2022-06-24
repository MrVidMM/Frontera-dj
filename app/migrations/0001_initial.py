# Generated by Django 4.0.4 on 2022-06-24 19:07

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Carrito',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'db_Carrito',
            },
        ),
        migrations.CreateModel(
            name='Suscripcion',
            fields=[
                ('usuario_sus', models.IntegerField(primary_key=True, serialize=False)),
                ('estado_sus', models.BooleanField()),
            ],
            options={
                'db_table': 'db_Suscripcion',
            },
        ),
        migrations.CreateModel(
            name='TipoProducto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo', models.CharField(max_length=60)),
            ],
            options={
                'db_table': 'db_tipo_Producto',
            },
        ),
        migrations.CreateModel(
            name='Producto',
            fields=[
                ('codigo', models.IntegerField(primary_key=True, serialize=False)),
                ('nombre', models.CharField(max_length=60)),
                ('marca', models.CharField(max_length=60)),
                ('precio', models.IntegerField()),
                ('stock', models.IntegerField()),
                ('imagen', models.ImageField(null=True, upload_to='productos')),
                ('created_at', models.DateField(auto_now_add=True)),
                ('update_at', models.DateField(auto_now=True)),
                ('tipo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.tipoproducto')),
            ],
            options={
                'db_table': 'db_Producto',
            },
        ),
        migrations.CreateModel(
            name='Historial',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.carrito')),
            ],
            options={
                'db_table': 'db_Historial',
            },
        ),
        migrations.AddField(
            model_name='carrito',
            name='codigo',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='app.producto'),
        ),
    ]
