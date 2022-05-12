from pyexpat import model
from django.db import models

# Create your models here.
class TipoProducto(models.Model):
    tipo = models.CharField(max_length=60)

    def __str__(self):
        return self.tipo

    class Meta:
        db_table = 'db_tipo_Producto'

class Producto(models.Model):
    codigo = models.IntegerField(null=False,primary_key=True)
    nombre = models.CharField(max_length=60)
    marca = models.CharField(max_length=60)
    precio = models.IntegerField()
    stock = models.IntegerField()
    tipo = models.ForeignKey(TipoProducto, on_delete=models.CASCADE)
    #agregar campo de imagen: nos permite almacenar sin problema el null=True
    imagen = models.ImageField(upload_to="productos", null=True)
    created_at = models.DateField(auto_now_add=True)
    update_at = models.DateField(auto_now=True)

    def __str__(self):
        return self.nombre

    class Meta:
        db_table = 'db_Producto'

class Carrito(models.Model):
    codigo = models.ForeignKey(Producto, on_delete=models.CASCADE)

    
    
    class Meta:
        db_table = 'db_Carrito'

#El if accede a la variable tipo, y accedes al atributo
#Trabajo con prog orientada a objetos
#