from django.urls import path
from .views import *

urlpatterns = [
    path('', index, name='index'),
    path('registrado/', registrado, name='registrado'),
    path('pagar/', pagar, name='pagar'),
    path('perfil/', perfil, name='perfil'),
    path('suscripcion/', suscripcion, name='suscripcion'),
    path('carrito/', carrito, name='carrito'),
    path('base/', base, name='base'),
    path('stock/', stock, name='stock'),
    path('historial/', historial, name='historial'),
    path('agregarProducto/', agregarProducto, name='agregarProducto'),
]