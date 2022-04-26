from django.shortcuts import render
# Create your views here.
def index(request):
    return render(request, 'app/index.html')

def registrado(request):
    return render(request, 'app/registrado.html')

def stock(request):
    return render(request, 'app/stock.html')

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