from django import forms
from django.forms import ModelForm
from .models import *
# Creamos un template del formulario
class ProductoForm (ModelForm):
    
    nombre = forms.CharField(min_length=10,max_length=20)
    precio = forms.IntegerField(min_value=400)
    class Meta: 
        model = Producto
        fields = ['codigo','nombre','marca','precio','stock', 'tipo','imagen','fecha_ingreso']

        widgets = {
            'fecha_ingreso' : forms.SelectDateWidget(years=range(2020,2023))
        }

    
        