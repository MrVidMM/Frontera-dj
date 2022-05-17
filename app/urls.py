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
    path('base_index/', base_index, name='base_index'),
    path('base_admin/', base_admin, name='base_admin'),
    path('admin/auth/user/', admin, name='admin'),
    path('stock/', stock, name='stock'),
    path('historial/', historial, name='historial'),
    path('agregarProducto/', agregarProducto, name='agregarProducto'),
    path('modificarProducto/<codigo>/', modificarProducto, name='modificarProducto'),
    path('eliminarProducto/<codigo>/', eliminarProducto, name='eliminarProducto'),
    path('listarProductos/', listarProductos, name='listarProductos'),
    path('registro/', registro, name='registro'),
    path('login/', login, name='login'),
]