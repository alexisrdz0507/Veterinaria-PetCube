from django.urls import path
from django.contrib.auth import views as auth_views
from . import views

urlpatterns = [
    # Página principal
    path('', views.home, name='home'),  # ← Agrega esta línea
    
    # Autenticación
    path('login/', auth_views.LoginView.as_view(template_name='veterinaria/login.html'), name='login'),
    path('cerrar/', views.cerrar_sesion, name='cerrar'),
    
    # Clientes (CRUD completo)
    path('clientes/', views.lista_clientes, name='clientes'),
    path('clientes/nuevo/', views.cliente_nuevo, name='cliente_nuevo'),
    path('clientes/editar/<int:id_cliente>/', views.cliente_editar, name='cliente_editar'),
    path('clientes/eliminar/<int:id_cliente>/', views.cliente_eliminar, name='cliente_eliminar'),
    
    # Mascotas
    path('mascotas/', views.lista_mascotas, name='mascotas'),
    path('mascotas/agregar/', views.agregar_mascota, name='agregar_mascota'),
    path('api/buscar-clientes/', views.buscar_clientes_api, name='buscar_clientes_api'),
    
    # Veterinarios
    path('veterinarios/', views.lista_veterinarios, name='veterinarios'),
    path('veterinarios/nuevo/', views.veterinario_nuevo, name='veterinario_nuevo'),
    path('veterinarios/editar/<int:id_veterinario>/', views.veterinario_editar, name='veterinario_editar'),
    path('veterinarios/eliminar/<int:id_veterinario>/', views.veterinario_eliminar, name='veterinario_eliminar'),
    
    # Consultas
    path('consultas/', views.lista_consultas, name='consultas'),
    
    # Ventas
    path('ventas/', views.lista_ventas, name='ventas'),
    path('ventas/nuevo/', views.venta_nueva, name='venta_nueva'),
    path('ventas/<int:id_venta>/facturar/', views.facturar_venta, name='facturar_venta'),
    
    # Clientes (área del cliente)
    path('mis-mascotas/', views.cliente_mis_mascotas, name='cliente_mis_mascotas'),
    path('mis-consultas/', views.cliente_mis_consultas, name='cliente_mis_consultas'),
    path('consulta/<int:id_consulta>/', views.cliente_detalle_consulta, name='cliente_detalle_consulta'),
    path('mi-perfil/', views.cliente_perfil, name='cliente_perfil'),
    
    # Inicio para veterinarios
    path('inicio/', views.inicio_veterinario, name='inicio_veterinario'),
    # Inicio para recepción
    path('recepcion/', views.inicio_recepcion, name='inicio_recepcion'),
    
    # Dashboard admin
    path('dashboard/', views.dashboard, name='dashboard'),
    
    # Backups
    
    path('backups/', views.lista_backups, name='lista_backups'),
    path('backup/crear/', views.crear_backup, name='crear_backup'),
    path('backups/descargar/<str:nombre_archivo>/', views.descargar_backup, name='descargar_backup'),

    
    # Panel de Administración (Empleados)
    path('administracion/panel/', views.admin_panel, name='admin_panel'),
    path('administracion/empleado/nuevo/', views.empleado_nuevo, name='empleado_nuevo'),
    path('administracion/empleado/editar/<int:id_empleado>/', views.empleado_editar, name='empleado_editar'),
    path('administracion/empleado/eliminar/<int:id_empleado>/', views.empleado_eliminar, name='empleado_eliminar'),

    #cargar mascotas dependiendo el cliente
    path('ajax/mascotas-por-cliente/<int:id_cliente>/', views.mascotas_por_cliente, name='mascotas_por_cliente'),
]