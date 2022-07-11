from pyexpat import model
from xmlrpc.client import boolean
from django import db
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
    id = models.AutoField(primary_key=True)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.IntegerField(null=True)
    usuario = models.IntegerField()

    def __str__(self):
        return self.id

    class Meta:
        db_table = 'db_Carrito'

class Suscripcion(models.Model):
    username = models.CharField(max_length=20,primary_key=True)
    suscrito =  models.BooleanField(default=False)#El profe comentó que esta mamada era boolean pero tambien menciono que se tenia que ocupar CHAR :v

    def __str__(self):
        return self.suscrito

    class Meta:
        db_table = 'db_Suscripcion'

class Historial(models.Model):
    codigo = models.ForeignKey(Carrito, on_delete=models.CASCADE)

    class Meta:
        db_table = "db_Historial"

class Seguimiento(models.Model):
    codigo = models.AutoField(null=False,primary_key=True)
    usuario = models.IntegerField()
    fechaCompra = models.DateField(auto_now_add=True)
    cantidad = models.IntegerField()
    producto = models.ForeignKey(Producto, on_delete= models.CASCADE)
    estado = models.CharField(max_length=50)
    imagen = models.ImageField(upload_to="productos", null=True)

    def __str__(self):
        return self.codigo

    class Meta:
        db_table = "db_Seguiento"

class EstadoSeguimiento(models.Model):
    codigo = models.ForeignKey(Seguimiento, on_delete=models.CASCADE)
    estado =  models.BooleanField

    class Meta:
        db_table = "db_EstadoSeguimiento"

class TipoUsuario(models.Model):
    tipo= models.CharField(max_length=25)

    def __str__(self):
        return self.tipo
    
    class Meta:
        db_table ='db_Tipo_usuario'

class Usuario(models.Model):
    run=models.IntegerField(null=False,primary_key=True)
    nombre=models.CharField(max_length=30)
    correo=models.CharField(max_length=30)
    numero=models.CharField(max_length=12)
    tipo=models.ForeignKey(TipoUsuario, on_delete=models.CASCADE)
    create_at = models.DateField(auto_now_add=True)
    update_at = models.DateField(auto_now=True)

    def __str__(self):
        return self.run

    class Meta:
        db_table ='db_Usuario'
