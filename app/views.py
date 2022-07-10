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

# CRUD SEGUIMIENTO
@login_required
def seguimiento(request):

    datos = { }

    producto = Producto()
    producto.codigo = request.POST.get('codigo')
    producto.nombre = request.POST.get('nombre')
    producto.marca = request.POST.get('marca')
    producto.precio = request.POST.get('precio')
    producto.stock = request.POST.get('stock')
    print(producto)
    datos['producto']= producto
    datos['estado'] = estado

    return render(request, 'app/seguimiento/seguimiento.html', datos)

@login_required
def listaSeguimiento(request):
    if request.method == 'POST':
        seguimiento= Seguimiento.objects.get(codigo=request.POST.get('codigo'))
        seguimiento.estado = request.POST.get('selecciona')
        seguimiento.save()

    seguimientoAll = Seguimiento.objects.all()
    datos = {
            'listaSeguimiento' : seguimientoAll,
            'usuario' : 0
    }
    return render(request, 'app/seguimiento/listaSeguimiento.html', datos)

@login_required
def modificarSegimiento(request):
    seguimientoAll = EstadoSeguimiento.objects.get(codigo=codigo)
    datos = {
        'form' : SeguimientoForm(instance=seguimientoAll)
    }

    if request.method == 'POST':
        formulario = SeguimientoForm(request.POST, files=request.FILES, instance=seguimientoAll)
        if formulario.is_valid():
            formulario.save()
            messages.success(request,'Producto guardado correctamente!') #Nuevo 2
            datos['form'] = formulario
            
    return render(request, 'app/seguimiento/modificarSegimiento.html', datos)

# CRUD CARRITO
@login_required
def stock(request):
    response = requests.get('http://127.0.0.1:8000/api/producto/').json()
    responseDigi = requests.get('https://digimon-api.vercel.app/api/digimon').json()
    responseRM = requests.get('https://rickandmortyapi.com/api/character').json()

    cid = request.user.id

    productosAll = Producto.objects.all()
    carritoAll = Carrito.objects.all()
    datos = {
        'listaProductos' : productosAll,
        'listaApi' : response,
        'listaDigi' : responseDigi,
        'listaRM' : responseRM,
        'listaCarrito' : carritoAll,
        'id' : cid
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
        carrito.usuario = cid
        carrito.cantidad = 0
        estado = True
        
        if Carrito.objects.filter(producto=request.POST.get('codigo')).exists():
            for i in carritoAll:
                if i.producto.nombre == producto.nombre:
                    i.cantidad += 1
                    i.save()
                    messages.success(request,'Producto guardado correctamente!')
                    estado = False
        else:
            carrito.producto = producto
            carrito.cantidad = 1
            carrito.save()
            estado = False

        if estado == True:
            carrito.producto = producto
            carrito.cantidad = 1
            carrito.save()
        
        codigo = request.POST.get('codigo')
        productoA = Producto.objects.get(codigo=codigo)
        if productoA == Producto.objects.get(codigo=codigo):
            if productoA.stock > 0:
                productoA.stock -= 1
                productoA.save()
                messages.success(request,'Producto guardado correctamente!')
            else: 
                producto.stock == 0
                productoA.save()
                messages.error(request,'No hay stock disponible!')

    return render(request, 'app/carrito/stock.html', datos)

@login_required
def carrito(request, id):
    carritoAll = Carrito.objects.filter(usuario=id)
    contador = Carrito.objects.count()

    datos = {
        'listaCarrito' : carritoAll,
        'contador' : contador,
        'usuario' : 0
    }

    datos['total'] = 0
    datos['contar'] = 0

    usuario = request.user.username
    if Suscripcion.objects.filter(username=usuario).exists():
        datos['usuario'] = 1

        for carrito in carritoAll:
            datos['totalsub'] = round((carrito.producto.precio * carrito.cantidad + datos['total']) * 0.95)
            datos['total'] = carrito.producto.precio * carrito.cantidad + datos['total']
            datos['descuento'] = round(datos['total'] * 0.05)
    else:
        for carrito in carritoAll:
            datos['total'] = carrito.producto.precio * carrito.cantidad + datos['total']
            datos['noSus'] = "¡Debes estar suscrito!"
            datos['contar'] = carrito.cantidad
    
    if request.method == 'POST':
        for i in carritoAll:
            seguimiento = Seguimiento()

            seguimiento.codigo = i.id
            seguimiento.cantidad = i.cantidad
            seguimiento.producto = i.producto
            seguimiento.usuario = i.usuario
            seguimiento.estado = "pago verificado"
            messages.success(request,'¡Pago exitoso!')

    return render(request, 'app/carrito/carrito.html', datos)

def limpiarCarrito(request):
    carrito = Carrito.objects.all()
    carrito.delete()

    return render(request, 'app/carrito/carrito.html')

# Devolver producto al stock
def devolver(request, codigo):
    carrito = Carrito.objects.get(producto_id=codigo)
    usuario= str(carrito.usuario)
    

    producto = Producto.objects.get(codigo=codigo)
    producto.stock += carrito.cantidad
    producto.save()
    
    carrito.delete()

    return redirect('/carrito/'+usuario)


@login_required
def pagar(request):
    carritoAll = Carrito.objects.all()
    historiaAll = Historial.objects.all()
    seguimientoAll = Seguimiento.objects.all()
    datos = {
        'listaCarrito' : carritoAll,
        'listaHistorial' : historiaAll,
        'listaSeguimiento' : seguimientoAll
    }

    if request.method == 'POST':
        producto = Producto.objects.get(codigo=request.POST.get('codigo'))
        carrito = Carrito.objects.get(codigo_id=producto.codigo)
        #seguimiento = Seguimiento.objects.get(codigo_id=producto.codigo)
        historial = Historial() 
        historial.codigo = carrito
        historial.save()

        #Necesario para vaciar carrito pero elimina el historial
        #carrito = Carrito.objects.all().delete()

        #seguimiento = Seguimiento()
        #seguimiento.codigo = carrito
        #seguimiento.save()
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
        'listaSuscripcion' : suscripcionAll,
        'form': SuscripcionForm(),
        'usuario' : 0
    }

    usuario= request.user.username

    if Suscripcion.objects.filter(username=usuario).exists():
        datos['usuario'] = 1

    if request.method == 'POST':
        suscripcion=Suscripcion()
        suscripcion.username = request.POST.get('username')
        suscripcion.suscrito = True
        suscripcion.save()
    return render(request, 'app/suscripcion/suscripcion.html', datos)

@login_required
def eliminarSuscripcion(request, username):
    suscripcion=Suscripcion.objects.get(username=username)
    suscripcion.delete()

    return redirect(to="suscripcion")