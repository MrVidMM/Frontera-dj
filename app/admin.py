from django.contrib import admin
from .models import *

# Register your models here.
class ProductoAdmin(admin.ModelAdmin):
    list_display = ['codigo','nombre','marca','precio','stock', 'tipo','imagen','created_at']
    search_fields = ['codigo']
    list_per_page = 10

class UsuarioAdmin(admin.ModelAdmin):
    list_display = ['run','nombre','correo','numero','tipo','created_at','updated_at']
    search_fields = ['run']
    list_per_page = 10

class SuscripcionAdmin(admin.ModelAdmin):
    list_display = ['usuario_sus','estado_sus']
    search_fields = ['usuario_sus']
    list_per_page = 10

class CarritoAdmin(admin.ModelAdmin):
    list_display = ['id','producto','cantidad','usuario']
    search_fields = ['usuario']
    list_per_page = 10

admin.site.register(TipoProducto)
admin.site.register(Producto, ProductoAdmin)
admin.site.register(Carrito)