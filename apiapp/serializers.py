from rest_framework import serializers
from app.models import *
from .serializers import *

#SE ENCARGA DE HACER EL CRUD DESDE EL API
# Serializers define the API representation.

class TipoProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoProducto
        fields = '__all__'

class ProductoSerializer(serializers.ModelSerializer):
    tipo = TipoProductoSerializer(read_only=True)
    class Meta:
        model = Producto
        fields = '__all__'

class TipoUsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model= TipoUsuario
        fields = '__all__'

class UsuarioSerializer(serializers.ModelSerializer):
    tipo = TipoProductoSerializer(read_only=True)
    class Meta:
        model= Usuario
        fields = '__all__'

class SuscripcionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Suscripcion
        fields = '__all__'