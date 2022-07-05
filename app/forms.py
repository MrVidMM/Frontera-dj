from django import forms
from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
# Creamos un template del formulario
class ProductoForm (forms.ModelForm):
    
    nombre = forms.CharField(min_length=10,max_length=20)
    precio = forms.IntegerField(min_value=400)
    
    class Meta: 
        model = Producto
        fields = '__all__'

class SuscripcionForm (forms.ModelForm):

    class Meta: 
        model = Suscripcion
        fields = ['usuario_sus', 'estado_sus']


class CustomUserCreationForm(UserCreationForm):
    
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name','email','password1','password2']

class SeguimientoForm (forms.ModelForm):

    class Meta: 
        model = EstadoSeguimiento
        fields = '__all__'

class UsuarioForm (forms.ModelForm):

    class Meta: 
        model = Usuario
        fields = ['run', 'nombre' , 'correo' , 'numero' , 'tipo' , 'created_at' , 'updated_at']

