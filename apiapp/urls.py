from django.urls import path, include
from rest_framework import routers
from .views import *

# Agrega una ruta en la API
# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r'producto', ProductoViewSet)
router.register('tipoProducto', TipoProductoViewSet)
router.register('usuario', UsuarioViewSet)
router.register('tipoUsuario', TipoUsuarioViewSet)
router.register('suscripcion', SuscripcionViewSet)
urlpatterns = [
    path('api/', include(router.urls)),
]
