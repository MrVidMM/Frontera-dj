from django.contrib import admin
from .models import *

# Register your models here.
class ProductoAdmin(admin.ModelAdmin):
    list_display = ['codigo','nombre','marca','precio','stock', 'tipo','imagen','created_at']
    search_fields = ['codigo']
    list_per_page = 10

class UsuarioAdmin(admin.ModelAdmin):
    list_display = ['run','nombre','correo','numero','tipo','create_at','update_at']
    search_fields = ['run']
    list_per_page = 10

class SuscripcionAdmin(admin.ModelAdmin):
    list_display = ['username','suscrito']
    search_fields = ['username']
    list_per_page = 10

class CarritoAdmin(admin.ModelAdmin):
    list_display = ['id','producto','cantidad','usuario']
    search_fields = ['usuario']
    list_per_page = 10

class SeguimientoAdmin(admin.ModelAdmin):
    list_display=['codigo','usuario','fechaCompra','cantidad','producto','estado']
    search_fields=['codigo']
    list_per_page= 10

admin.site.register(TipoProducto)
admin.site.register(Producto, ProductoAdmin)
admin.site.register(Carrito, CarritoAdmin)
admin.site.register(Usuario, UsuarioAdmin)
admin.site.register(Suscripcion, SuscripcionAdmin)
admin.site.register(TipoUsuario)
admin.site.register(Seguimiento, SeguimientoAdmin)