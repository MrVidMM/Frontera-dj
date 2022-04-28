from django.db import models

# Create your models here.
class TipoProducto(models.Model):
    tipo = models.CharField(max_length=20)

    def __str__(self):
        return self.tipo

class Producto(models.Model):
    codigo = models.IntegerField()
    nombre = models.CharField(max_length=20)
    marca = models.CharField(max_length=20)
    precio = models.IntegerField()
    stock = models.IntegerField()
    tipo = models.ForeignKey(TipoProducto, on_delete=models.CASCADE)

    def __str__(self):
        return self.nombre