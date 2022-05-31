from rest_framework import serializers
from app.models import *

#SE ENCARGA DE HACER EL CRUD DESDE EL API
# Serializers define the API representation.
class ProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = '__all__'