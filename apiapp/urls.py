from django.urls import path, include
from rest_framework import routers
from .views import *

# Agrega una ruta en la API
# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r'producto', ProductoViewSet)

urlpatterns = [
    path('api/', include(router.urls)),
]
