from django.shortcuts import render
from .models import * 
from .forms import *
# Create your views here.
def index(request):
    return render(request, 'app/index.html')

def registrado(request):
    return render(request, 'app/registrado.html')

def stock(request):
    productosAll = Producto.objects.all()
    datos = {
        'listaProductos' : productosAll
    }
    return render(request, 'app/stock.html', datos)

def historial(request):
    return render(request, 'app/historial.html')

def pagar(request):
    return render(request, 'app/pagar.html')

def perfil(request):
    return render(request, 'app/perfil.html')

def suscripcion(request):
    return render(request, 'app/suscripcion.html')

def carrito(request):
    return render(request, 'app/carrito.html')

def base(request):
    return render(request, 'app/base.html')

def agregarProducto(request):
    datos = {'form' : ProductoForm()}

    if request.method == 'POST':
        formulario = ProductoForm(request.POST)
        if formulario.is_valid():
            formulario.save()
            datos['mensaje'] = "Producto guardado correctamente!"
            
    return render(request, 'app/agregarProducto.html', datos)