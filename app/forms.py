from django import forms
from django.forms import ModelForm
from .models import *
# Creamos un template del formulario
class ProductoForm (ModelForm):
    
    class Meta: 
        model = Producto
        fields = ['codigo','nombre','marca','precio','stock', 'tipo']
        