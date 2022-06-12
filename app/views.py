from itertools import count
import requests

from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import authenticate, login as user_login
from django.contrib.auth.decorators import login_required, permission_required
from .models import * 
from .forms import *


# Create your views here.
def index(request):
    return render(request, 'app/index.html')

@login_required
def advertencia(request):
    return render(request, 'app/advertencia.html')  

@login_required
def registrado(request):
    return render(request, 'app/registrado.html')

@login_required
def historial(request):
    historiaAll = Historial.objects.all()
    contador = Historial.objects.count()
    datos = {
        'listaHistorial' : historiaAll,
        'contador' : contador
    }
    if request.method == 'POST':
        historial = Historial.objects.all().delete()
        return redirect(to='historial')
    return render(request, 'app/historial.html', datos)

@login_required
def perfil(request):
    return render(request, 'app/perfil.html')

# CRUD CARRITO
@login_required
def stock(request):
    response = requests.get('http://127.0.0.1:8000/api/producto/').json()
    responseDigi = requests.get('https://digimon-api.vercel.app/api/digimon').json()
    responseRM = requests.get('https://rickandmortyapi.com/api/character').json()
    productosAll = Producto.objects.all()
    datos = {
        'listaProductos' : productosAll,
        'listaApi' : response,
        'listaDigi' : responseDigi,
        'listaRM' : responseRM,
    }
    if request.method == 'POST':
        tipoProducto = TipoProducto()
        tipoProducto.tipo = request.POST.get('tipo')

        producto = Producto()
        producto.codigo = request.POST.get('codigo')
        producto.nombre = request.POST.get('nombre')
        producto.marca = request.POST.get('marca')
        producto.precio = request.POST.get('precio')
        producto.stock = request.POST.get('stock')
        producto.tipo = tipoProducto
        producto.imagen = request.POST.get('imagen')
        carrito = Carrito()
        carrito.codigo = producto
        carrito.save()
        messages.success(request,'Producto guardado correctamente!')
        
        codigo = request.POST.get('codigo')
        productoA = Producto.objects.get(codigo=codigo)
        productoA.stock -= 1
        productoA.save()

    return render(request, 'app/carrito/stock.html', datos)

@login_required
def carrito(request):
    carritoAll = Carrito.objects.all()
    contador = Carrito.objects.count()
    datos = {
        'listaCarrito' : carritoAll,
        'contador' : contador
    }

    if request.method == 'POST':
        carrito = Carrito.objects.all().delete()
        return redirect(to='carrito')
    return render(request, 'app/carrito/carrito.html', datos)

@login_required
def pagar(request):
    carritoAll = Carrito.objects.all()
    historiaAll = Historial.objects.all()
    datos = {
        'listaCarrito' : carritoAll,
        'listaHistorial' : historiaAll
    }

    if request.method == 'POST':
        carrito = Carrito.objects.all().delete()
        historial = Historial() 
        historial.id = carrito
        historial.save()
        return render(request, 'app/registrado.html')
    return render(request, 'app/carrito/pagar.html', datos)

def base(request):
    return render(request, 'app/base.html')

def base_index(request):
    return render(request, 'app/base_index.html')

def base_admin(request):
    return render(request, 'app/base_admin.html')


def admin(request):
    return render(request, 'app/admin/auth/user/')

# CRUD PRODUCTOS
@permission_required('app.add_producto')
def agregarProducto(request):
    datos = {
        'form' : ProductoForm()
    }

    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            messages.success(request,'Producto guardado correctamente!') #Nuevo 2
            
    return render(request, 'app/productos/agregarProducto.html', datos)

@permission_required('app.update_producto')
def modificarProducto(request, codigo):
    producto = Producto.objects.get(codigo=codigo)
    datos = {
        'form' : ProductoForm(instance=producto)
    }

    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES, instance=producto)
        if formulario.is_valid():
            formulario.save()
            messages.success(request,'Producto guardado correctamente!') #Nuevo 2
            datos['form'] = formulario
            
    return render(request, 'app/productos/modificarProducto.html', datos)

@permission_required('app.view_producto')
def listarProductos(request):
    productosAll = Producto.objects.all()
    datos = {
        'listaProductos' : productosAll
    }
    
    return render(request, 'app/productos/listarProductos.html', datos)

@permission_required('app.delete_producto')
def eliminarProducto(request, codigo):
    producto = Producto.objects.get(codigo=codigo)
    producto.delete()

    return redirect(to="listarProductos")

# CRUD DE USER
def registro(request):
    datos = {
        'form': CustomUserCreationForm()
    }

    if request.method == 'POST':
        formulario = CustomUserCreationForm(data=request.POST)
        if formulario.is_valid():
            formulario.save()
            user = authenticate(username=formulario.cleaned_data["username"], password=formulario.cleaned_data["password1"])
            user_login(request, user)
            messages.success(request, "Te has registrado correctamente")
            return redirect(to="registrado")
        datos["form"] = formulario
    return render(request, 'registration/registro.html', datos)

def login(request):
    messages.success(request, "Has iniciado correctamente")
    return render(request, 'registration/login.html')

# Nuevas APIs
@login_required
def stockApi(request):
    response = requests.get('http://127.0.0.1:8000/api/producto/').json()

    datos = {
        'listaApi' : response,
    }
    return render(request, 'app/carrito/stockApi.html', datos)

@login_required
def stockGames(request):
    response = requests.get('https://www.freetogame.com/api/games').json()

    datos = {
        'listaGames' : response,
    }
    return render(request, 'app/carrito/stockGames.html', datos)

@login_required
def stockDigi(request):
    response = requests.get('https://digimon-api.vercel.app/api/digimon').json()

    datos = {
        'listaDigi' : response,
    }
    return render(request, 'app/carrito/stockDigi.html', datos)

@login_required
def stockRM(request):
    response = requests.get('https://rickandmortyapi.com/api/character').json()

    datos = {
        'listaRM' : response['results'],
    }
    return render(request, 'app/carrito/stockRM.html', datos)

# CRUD SUSCRIPCIÓN
#Esto esta listo, ahora que meterle el permiso para que solo los usuarios con los permisos de ver suscripcion se puedan metyer, para ello hayq ue crear un grupo de susarios en ela dmin de Django los cuales tengan todos los permisos de usuariso normales mas el de ver la suscripcion en perfil
#pero en si esto esta listo, ya lo confirme con el profe, ahora falta hacerle el resto del crud
@login_required
def suscripcion(request):
    suscripcionAll = Suscripcion.objects.all()
    datos = {
        'listaSuscripcion' : suscripcionAll
    }
    if request.method == 'POST':
        suscripcion = Suscripcion()
        Suscripcion.usuario = request.POST.get('usuario')
        Suscripcion.estado = request.POST.get('estado_sus')
        suscripcion.save()
    return render(request, 'app/suscripcion/suscripcion.html', datos)

def agregarSuscripcion(request):
    datos = {
        'form' : SuscripForm()
    }

    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            messages.success(request,'Suscripción guardada correctamente!')
            
    return render(request, 'app/suscripcion/agregarSus.html', datos)