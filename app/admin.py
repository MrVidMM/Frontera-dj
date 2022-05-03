from django.contrib import admin
from .models import *

# Register your models here.
class ProductoAdmin(admin.ModelAdmin):
    list_display = ['codigo','nombre','marca','precio','stock', 'tipo','imagen','fecha_ingreso']
    search_fields = ['codigo']
    list_per_page = 10

admin.site.register(TipoProducto)
admin.site.register(Producto, ProductoAdmin)