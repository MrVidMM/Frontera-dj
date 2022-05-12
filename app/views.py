from django.shortcuts import render, redirect
from .models import * 
from .forms import *

# Create your views here.
def index(request):
    return render(request, 'app/index.html')

def registrado(request):
    return render(request, 'app/registrado.html')

def historial(request):
    return render(request, 'app/historial.html')

def perfil(request):
    return render(request, 'app/perfil.html')

def suscripcion(request):
    return render(request, 'app/suscripcion.html')

# CRUD CARRITO
def stock(request):
    productosAll = Producto.objects.all()
    datos = {
        'listaProductos' : productosAll
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
        
        
    return render(request, 'app/stock.html', datos)


def carrito(request):
    carritoAll = Carrito.objects.all()
    datos = {
        'listaCarrito' : carritoAll
    }

    return render(request, 'app/carrito.html', datos)

def pagar(request):
    return render(request, 'app/pagar.html')

def base(request):
    return render(request, 'app/base.html')

# CRUD PRODUCTOS
def agregarProducto(request):
    datos = {'form' : ProductoForm()}

    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES)
        if formulario.is_valid():
            formulario.save()
            datos['mensaje'] = "Producto guardado correctamente!"
            
    return render(request, 'app/productos/agregarProducto.html', datos)

def modificarProducto(request, codigo):
    producto = Producto.objects.get(codigo=codigo)
    datos = {
        'form' : ProductoForm(instance=producto)
    }

    if request.method == 'POST':
        formulario = ProductoForm(request.POST, files=request.FILES, instance=producto)
        if formulario.is_valid():
            formulario.save()
            datos['mensaje'] = "Producto modificado correctamente!"
            datos['form'] = formulario
            
    return render(request, 'app/productos/modificarProducto.html', datos)

    
def listarProductos(request):
    productosAll = Producto.objects.all()
    datos = {
        'listaProductos' : productosAll
    }

    return render(request, 'app/productos/listarProductos.html', datos)

def eliminarProducto(request, codigo):
    producto = Producto.objects.get(codigo=codigo)
    producto.delete()

    return redirect(to="listarProductos")
