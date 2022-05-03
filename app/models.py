from django.db import models

# Create your models here.
class TipoProducto(models.Model):
    tipo = models.CharField(max_length=60)

    def __str__(self):
        return self.tipo

class Producto(models.Model):
    codigo = models.IntegerField()
    nombre = models.CharField(max_length=60)
    marca = models.CharField(max_length=60)
    precio = models.IntegerField()
    stock = models.IntegerField()
    tipo = models.ForeignKey(TipoProducto, on_delete=models.CASCADE)
    #agregar campo de imagen: nos permite almacenar sin problema el null=True
    imagen = models.ImageField(upload_to="productos", null=True)

    def __str__(self):
        return self.nombre