from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth import logout
from django.contrib.auth.models import User
from django.db import transaction
from django.db.models import Count, Q
from django.http import FileResponse, Http404, JsonResponse
from django.conf import settings
from functools import wraps
from decimal import Decimal
from django.db import connection
from datetime import datetime, timedelta
import os
import pyodbc
from .models import (
    ClientesVeterinariaPetcube,
    EspeciesVeterinariaPetcube,
    RazasVeterinariaPetcube,
    MascotasVeterinariaPetcube,
    VeterinariosVeterinariaPetcube,
    ConsultasVeterinariaPetcube,
    ExpedientesVeterinariaPetcube,
    ServiciosVeterinariaPetcube,
    VacunasVeterinariaPetcube,
    ProductosVeterinariaPetcube,
    CitasVeterinariaPetcube,
    MascotasVacunasVeterinariaPetcube,
    VentasVeterinariaPetcube,
    DetalleVentasVeterinariaPetcube,
    FacturasVeterinariaPetcube,
    TratamientosVeterinariaPetcube,
    ClientesSeguridadVeterinariaPetcube,
    TratamientosSeguridadVeterinariaPetcube,
    ErroresVeterinariaPetcube,
    PerfilUsuario,
)

# ==================== DECORADORES PARA ROLES ====================
def es_dueno(user):
    return user.is_superuser

def requiere_rol(roles_permitidos):
    def decorator(view_func):
        @wraps(view_func)
        def wrapper(request, *args, **kwargs):
            if not request.user.is_authenticated:
                return redirect('/login/')
            
            if request.user.is_superuser:
                return view_func(request, *args, **kwargs)
            
            perfil = obtener_o_crear_perfil(request.user)
            if perfil and perfil.rol in roles_permitidos:
                return view_func(request, *args, **kwargs)
            
            return render(request, 'veterinaria/error_permiso.html')
        return wrapper
    return decorator

# ==================== HELPERS ====================

def obtener_o_crear_perfil(user):
    """Retorna el perfil del usuario, o lo crea si corresponde a un cliente existente."""
    if not user.is_authenticated:
        return None
    try:
        return user.perfil
    except PerfilUsuario.DoesNotExist:
        if user.email:
            cliente = ClientesVeterinariaPetcube.objects.filter(correo__iexact=user.email).first()
            if cliente:
                perfil = PerfilUsuario.objects.create(
                    user=user,
                    rol='cliente',
                    id_cliente=cliente.id_cliente
                )
                return perfil
        return None

# ==================== LOGIN / LOGOUT ====================
def cerrar_sesion(request):
    logout(request)
    return redirect('/')

# ==================== PÁGINA DE INICIO ====================
def home(request):
    """Página de inicio - Landing page pública o dashboard según autenticación"""
    # Si NO está autenticado, mostrar landing page pública
    if not request.user.is_authenticated:
        servicios = ServiciosVeterinariaPetcube.objects.filter(estado_servicio__iexact='Activo')[:6]
        if not servicios:
            servicios = ServiciosVeterinariaPetcube.objects.all()[:6]

        veterinarios = VeterinariosVeterinariaPetcube.objects.all()[:4]
        total_servicios = ServiciosVeterinariaPetcube.objects.count()
        total_veterinarios = VeterinariosVeterinariaPetcube.objects.count()
        total_mascotas = MascotasVeterinariaPetcube.objects.count()

        return render(request, 'veterinaria/landing.html', {
            'servicios': servicios,
            'veterinarios': veterinarios,
            'total_servicios': total_servicios,
            'total_veterinarios': total_veterinarios,
            'total_mascotas': total_mascotas,
        })
    
    # Mostrar landing page pública siempre, incluso si el usuario está autenticado.
    servicios = ServiciosVeterinariaPetcube.objects.filter(estado_servicio__iexact='Activo')[:6]
    if not servicios:
        servicios = ServiciosVeterinariaPetcube.objects.all()[:6]

    veterinarios = VeterinariosVeterinariaPetcube.objects.all()[:4]
    total_servicios = ServiciosVeterinariaPetcube.objects.count()
    total_veterinarios = VeterinariosVeterinariaPetcube.objects.count()
    total_mascotas = MascotasVeterinariaPetcube.objects.count()

    return render(request, 'veterinaria/landing.html', {
        'servicios': servicios,
        'veterinarios': veterinarios,
        'total_servicios': total_servicios,
        'total_veterinarios': total_veterinarios,
        'total_mascotas': total_mascotas,
    })

# ==================== INICIO VETERINARIO ====================
@login_required
@requiere_rol(['empleado', 'admin'])
def inicio_veterinario(request):
    perfil = obtener_o_crear_perfil(request.user)
    
    if perfil and perfil.rol == 'recepcionista':
        return redirect('/recepcion/')

    total_clientes = ClientesVeterinariaPetcube.objects.count()
    total_mascotas = MascotasVeterinariaPetcube.objects.count()
    total_veterinarios = VeterinariosVeterinariaPetcube.objects.count()
    total_consultas = ConsultasVeterinariaPetcube.objects.count()

    return render(request, 'veterinaria/dashboard.html', {
        'total_clientes': total_clientes,
        'total_mascotas': total_mascotas,
        'total_veterinarios': total_veterinarios,
        'total_consultas': total_consultas,
    })

# ==================== INICIO RECEPCIÓN ====================
@login_required
@requiere_rol(['recepcionista'])
def inicio_recepcion(request):
    perfil = obtener_o_crear_perfil(request.user)
    
    if request.user.is_superuser or (perfil and perfil.rol != 'recepcionista'):
        return redirect('/dashboard/')

    total_clientes = ClientesVeterinariaPetcube.objects.count()
    total_mascotas = MascotasVeterinariaPetcube.objects.count()
    total_ventas = VentasVeterinariaPetcube.objects.count()
    total_consultas = ConsultasVeterinariaPetcube.objects.count()

    return render(request, 'veterinaria/recepcion_dashboard.html', {
        'total_clientes': total_clientes,
        'total_mascotas': total_mascotas,
        'total_ventas': total_ventas,
        'total_consultas': total_consultas,
    })

# ==================== DASHBOARD ADMIN ====================
@login_required
@requiere_rol(['admin'])
def dashboard(request):
    if not request.user.is_superuser:
        return render(request, 'veterinaria/error_permiso.html')
    
    ultimas_consultas = ConsultasVeterinariaPetcube.objects.select_related('id_mascota', 'id_veterinario').order_by('-fecha_consulta')[:10]
    empleados = PerfilUsuario.objects.select_related('user').filter(rol='empleado')

    grafico_consultas = "<p>Gráficos desactivados. Consulta las estadísticas debajo.</p>"
    grafico_especies = "<p>Gráficos desactivados. Consulta las estadísticas debajo.</p>"

    total_clientes = ClientesVeterinariaPetcube.objects.count()
    total_mascotas = MascotasVeterinariaPetcube.objects.count()
    total_veterinarios = VeterinariosVeterinariaPetcube.objects.count()
    total_consultas = ConsultasVeterinariaPetcube.objects.count()
    total_citas = CitasVeterinariaPetcube.objects.count()
    total_tratamientos = TratamientosVeterinariaPetcube.objects.count()
    total_ventas = VentasVeterinariaPetcube.objects.count()
    total_facturas = FacturasVeterinariaPetcube.objects.count()
    total_empleados = PerfilUsuario.objects.filter(rol='empleado').count()

    return render(request, 'veterinaria/dashboard_admin.html', {
        'grafico_consultas': grafico_consultas,
        'grafico_especies': grafico_especies,
        'total_clientes': total_clientes,
        'total_mascotas': total_mascotas,
        'total_veterinarios': total_veterinarios,
        'total_consultas': total_consultas,
        'total_citas': total_citas,
        'total_tratamientos': total_tratamientos,
        'total_ventas': total_ventas,
        'total_facturas': total_facturas,
        'total_empleados': total_empleados,
        'empleados': empleados,
        'ultimas_consultas': ultimas_consultas
    })

# ==================== CLIENTES (CRUD COMPLETO) ====================
@login_required
def lista_clientes(request):
    clientes = ClientesVeterinariaPetcube.objects.all()
    return render(request, 'veterinaria/clientes.html', {'clientes': clientes})

@login_required
@requiere_rol(['empleado', 'admin', 'recepcionista'])
def cliente_nuevo(request):
    especies = EspeciesVeterinariaPetcube.objects.all()
    razas = RazasVeterinariaPetcube.objects.all()

    if request.method == 'POST':
        ultimo = ClientesVeterinariaPetcube.objects.order_by('-id_cliente').first()
        nuevo_id = (ultimo.id_cliente + 1) if ultimo else 1

        cliente = ClientesVeterinariaPetcube(
            id_cliente=nuevo_id,
            nombre=request.POST.get('nombre'),
            apellido_paterno=request.POST.get('apellido_paterno'),
            apellido_materno=request.POST.get('apellido_materno'),
            telefono=request.POST.get('telefono'),
            correo=request.POST.get('correo'),
            direccion=request.POST.get('direccion'),
            fecha_registro=request.POST.get('fecha_registro'),
        )
        cliente.save()

        #  CREAR MASCOTA ASOCIADA
        ultimo_mascota = MascotasVeterinariaPetcube.objects.order_by('-id_mascota').first()
        nuevo_id_mascota = (ultimo_mascota.id_mascota + 1) if ultimo_mascota else 1
        especie = EspeciesVeterinariaPetcube.objects.get(id_especie=request.POST.get('id_especie'))
        raza = RazasVeterinariaPetcube.objects.get(id_raza=request.POST.get('id_raza'))

        mascota = MascotasVeterinariaPetcube(
            id_mascota=nuevo_id_mascota,
            id_cliente=cliente,
            id_especie=especie,
            id_raza=raza,
            nombre=request.POST.get('nombre_mascota'),
            sexo=request.POST.get('sexo'),
            fecha_nacimiento=request.POST.get('fecha_nacimiento'),
            peso=request.POST.get('peso'),
        )
        mascota.save()

        #  CREAR USER
        user = User.objects.create_user(
            username=f"cli_{cliente.id_cliente}",
            first_name=cliente.nombre,
            last_name=f"{cliente.apellido_paterno} {cliente.apellido_materno}",
            email=cliente.correo,
            password="cliente123"
        )

        #  CREAR PERFIL
        PerfilUsuario.objects.create(
            user=user,
            rol='cliente',
            id_cliente=cliente.id_cliente
        )

        return redirect('/clientes/')

    return render(request, 'veterinaria/cliente_form.html', {
        'titulo': 'Nuevo Cliente',
        'cliente': None,
        'especies': especies,
        'razas': razas
    })

@login_required
@requiere_rol(['empleado', 'admin', 'recepcionista'])
def cliente_editar(request, id_cliente):
    cliente = get_object_or_404(ClientesVeterinariaPetcube, id_cliente=id_cliente)

    if request.method == 'POST':
        #  SOLO se modifican campos del CLIENTE
        cliente.nombre = request.POST.get('nombre')
        cliente.apellido_paterno = request.POST.get('apellido_paterno')
        cliente.apellido_materno = request.POST.get('apellido_materno')
        cliente.telefono = request.POST.get('telefono')
        cliente.correo = request.POST.get('correo')
        cliente.direccion = request.POST.get('direccion')
        cliente.fecha_registro = request.POST.get('fecha_registro')
        cliente.save()

        #  Actualizar el User correspondiente
        perfiles_cliente = PerfilUsuario.objects.filter(id_cliente=id_cliente)
        for perfil in perfiles_cliente:
            user = perfil.user
            user.first_name = cliente.nombre
            user.last_name = f"{cliente.apellido_paterno} {cliente.apellido_materno}"
            user.email = cliente.correo
            user.save()

        return redirect('/clientes/')

    return render(request, 'veterinaria/cliente_form.html', {
        'titulo': 'Editar Cliente',
        'cliente': cliente
    })


@login_required
def cliente_eliminar(request, id_cliente):
    cliente = get_object_or_404(ClientesVeterinariaPetcube, id_cliente=id_cliente)

    # Obtener perfil del usuario que hace la acción
    try:
        perfil_actual = request.user.perfil
    except:
        return render(request, 'veterinaria/error_permiso.html')

    # Buscar perfil del cliente (si existe)
    perfiles_cliente = PerfilUsuario.objects.filter(id_cliente=id_cliente)
    usuario_clientes_ids = list(perfiles_cliente.values_list('user_id', flat=True).distinct())
    usuario_clientes = User.objects.filter(id__in=usuario_clientes_ids)

    def eliminar_datos_relacionados(cliente_obj):
        mascotas_ids = MascotasVeterinariaPetcube.objects.filter(id_cliente=cliente_obj).values_list('id_mascota', flat=True)
        TratamientosVeterinariaPetcube.objects.filter(id_consulta__in=ConsultasVeterinariaPetcube.objects.filter(id_mascota__in=mascotas_ids)).delete()
        ConsultasVeterinariaPetcube.objects.filter(id_mascota__in=mascotas_ids).delete()
        CitasVeterinariaPetcube.objects.filter(id_mascota__in=mascotas_ids).delete()
        ExpedientesVeterinariaPetcube.objects.filter(id_mascota__in=mascotas_ids).delete()
        MascotasVacunasVeterinariaPetcube.objects.filter(id_mascota__in=mascotas_ids).delete()
        MascotasVeterinariaPetcube.objects.filter(id_cliente=cliente_obj).delete()

        ventas_ids = VentasVeterinariaPetcube.objects.filter(id_cliente=cliente_obj).values_list('id_venta', flat=True)
        FacturasVeterinariaPetcube.objects.filter(id_venta__in=ventas_ids).delete()
        DetalleVentasVeterinariaPetcube.objects.filter(id_venta__in=ventas_ids).delete()
        VentasVeterinariaPetcube.objects.filter(id_cliente=cliente_obj).delete()

    #  CASO 1: EMPLEADO
    if perfil_actual.rol == 'empleado':
        # El empleado SOLO puede borrar el registro del cliente y sus datos relacionados
        with transaction.atomic():
            eliminar_datos_relacionados(cliente)
            cliente.delete()
        return redirect('/clientes/')

    #  CASO 2: ADMIN
    if perfil_actual.rol == 'admin' or request.user.is_superuser:
        # Seguridad: impedir que se borre a sí mismo
        if any(usuario.id == request.user.id for usuario in usuario_clientes):
            return render(request, 'veterinaria/error_permiso.html', {
                'error': 'No puedes eliminar tu propio usuario.'
            })

        with transaction.atomic():
            eliminar_datos_relacionados(cliente)

            # Borrar usuario y perfil si existen
            if perfiles_cliente.exists():
                perfiles_cliente.delete()
            for usuario in usuario_clientes:
                usuario.delete()

            # Borrar cliente
            cliente.delete()
        return redirect('/clientes/')

    # 🔴 CUALQUIER OTRO ROL
    return render(request, 'veterinaria/error_permiso.html')


# ==================== MASCOTAS ====================
@login_required
def lista_mascotas(request):
    mascotas = MascotasVeterinariaPetcube.objects.all()
    return render(request, 'veterinaria/mascotas.html', {'mascotas': mascotas})

# ==================== AGREGAR MASCOTAS (VETERINARIOS) ====================
@login_required
@requiere_rol(['empleado', 'admin'])
def agregar_mascota(request):
    """Vista para que veterinarios busquen clientes y agreguen mascotas"""
    especies = EspeciesVeterinariaPetcube.objects.all()
    razas = RazasVeterinariaPetcube.objects.all()
    
    if request.method == 'POST':
        id_cliente = request.POST.get('id_cliente')
        nombre = request.POST.get('nombre')
        id_especie = request.POST.get('id_especie')
        id_raza = request.POST.get('id_raza')
        sexo = request.POST.get('sexo')
        fecha_nacimiento = request.POST.get('fecha_nacimiento')
        peso = request.POST.get('peso')
        
        try:
            cliente = ClientesVeterinariaPetcube.objects.get(id_cliente=id_cliente)
            especie = EspeciesVeterinariaPetcube.objects.get(id_especie=id_especie)
            raza = RazasVeterinariaPetcube.objects.get(id_raza=id_raza)
            
            ultimo = MascotasVeterinariaPetcube.objects.order_by('-id_mascota').first()
            nuevo_id = (ultimo.id_mascota + 1) if ultimo else 1
            
            mascota = MascotasVeterinariaPetcube(
                id_mascota=nuevo_id,
                id_cliente=cliente,
                id_especie=especie,
                id_raza=raza,
                nombre=nombre,
                sexo=sexo,
                fecha_nacimiento=fecha_nacimiento,
                peso=peso
            )
            mascota.save()
            
            return redirect('mascotas')
        except Exception as e:
            return render(request, 'veterinaria/error_permiso.html', {
                'mensaje': f'Error al agregar mascota: {str(e)}'
            })
    
    return render(request, 'veterinaria/agregar_mascota.html', {
        'especies': especies,
        'razas': razas
    })

@login_required
@requiere_rol(['empleado', 'admin'])
def buscar_clientes_api(request):
    """API para buscar clientes por nombre o número de documento"""
    query = request.GET.get('q', '')
    
    if len(query) < 2:
        return JsonResponse([], safe=False)
    
    clientes = ClientesVeterinariaPetcube.objects.filter(
        Q(nombre__icontains=query) | 
        Q(apellido_paterno__icontains=query) |
        Q(correo__icontains=query)
    )[:10]
    
    data = [
        {
            'id': c.id_cliente,
            'nombre': f"{c.nombre} {c.apellido_paterno} {c.apellido_materno}",
            'correo': c.correo,
            'telefono': c.telefono
        }
        for c in clientes
    ]
    
    return JsonResponse(data, safe=False)

# ==================== VETERINARIOS ====================

@login_required
def lista_veterinarios(request):
    veterinarios = VeterinariosVeterinariaPetcube.objects.all()
    es_admin = request.user.is_superuser

    return render(request, 'veterinaria/veterinarios.html', {
        'veterinarios': veterinarios,
        'es_admin': es_admin
    })


@user_passes_test(es_dueno)
def veterinario_nuevo(request):
    if request.method == 'POST':
        ultimo = VeterinariosVeterinariaPetcube.objects.order_by('-id_veterinario').first()
        nuevo_id = (ultimo.id_veterinario + 1) if ultimo else 1
        
        veterinario = VeterinariosVeterinariaPetcube(
            id_veterinario=nuevo_id,
            nombre=request.POST.get('nombre'),
            apellido_paterno=request.POST.get('apellido_paterno'),
            apellido_materno=request.POST.get('apellido_materno'),
            especialidad=request.POST.get('especialidad'),
            telefono=request.POST.get('telefono'),
            correo=request.POST.get('correo'),
            horario=request.POST.get('horario'),
        )
        veterinario.save()
        return redirect('/veterinarios/')
    return render(request, 'veterinaria/veterinario_form.html', {'titulo': 'Nuevo Veterinario', 'veterinario': None})

@user_passes_test(es_dueno)
def veterinario_editar(request, id_veterinario):
    veterinario = get_object_or_404(VeterinariosVeterinariaPetcube, id_veterinario=id_veterinario)
    if request.method == 'POST':
        veterinario.nombre = request.POST.get('nombre')
        veterinario.apellido_paterno = request.POST.get('apellido_paterno')
        veterinario.apellido_materno = request.POST.get('apellido_materno')
        veterinario.especialidad = request.POST.get('especialidad')
        veterinario.telefono = request.POST.get('telefono')
        veterinario.correo = request.POST.get('correo')
        veterinario.horario = request.POST.get('horario')
        veterinario.save()
        return redirect('/veterinarios/')
    return render(request, 'veterinaria/veterinario_form.html', {'titulo': 'Editar Veterinario', 'veterinario': veterinario})

@user_passes_test(es_dueno)
def veterinario_eliminar(request, id_veterinario):
    veterinario = get_object_or_404(VeterinariosVeterinariaPetcube, id_veterinario=id_veterinario)
    veterinario.delete()
    return redirect('/veterinarios/')

# ==================== CONSULTAS ====================
@login_required
def lista_consultas(request):
    consultas = ConsultasVeterinariaPetcube.objects.all()
    return render(request, 'veterinaria/consultas.html', {'consultas': consultas})

@login_required
@requiere_rol(['empleado', 'admin'])
def consulta_nueva(request):
    clientes = ClientesVeterinariaPetcube.objects.all()

    if request.method == 'POST':
        id_cliente = request.POST.get('id_cliente')
        id_mascota = request.POST.get('id_mascota')
        motivo = request.POST.get('motivo')

        #  Obtener mascota
        mascota = MascotasVeterinariaPetcube.objects.get(id_mascota=id_mascota)

        #  Obtener veterinario desde el usuario logueado
        veterinario = VeterinariosVeterinariaPetcube.objects.get(
            correo=request.user.email
        )

        #  Generar ID de consulta
        ultimo = ConsultasVeterinariaPetcube.objects.order_by('-id_consulta').first()
        nuevo_id = (ultimo.id_consulta + 1) if ultimo else 1

        consulta = ConsultasVeterinariaPetcube(
            id_consulta=nuevo_id,
            fecha_consulta=datetime.now(),
            motivo=motivo,
            estado='Pendiente',
            id_mascota=mascota,
            id_veterinario=veterinario
        )
        consulta.save()

        return redirect('/consultas/')

    return render(request, 'veterinaria/consulta_form.html', {
        'clientes': clientes
    })

# ==================== CLIENTES (ÁREA DEL CLIENTE) ====================
@login_required
def cliente_mis_mascotas(request):
    perfil = obtener_o_crear_perfil(request.user)
    if perfil and perfil.rol == 'cliente' and perfil.id_cliente:
        mascotas = MascotasVeterinariaPetcube.objects.filter(id_cliente=perfil.id_cliente)
    else:
        mascotas = []
    
    return render(request, 'veterinaria/cliente_mascotas.html', {'mascotas': mascotas})

@login_required
def cliente_mis_consultas(request):
    perfil = obtener_o_crear_perfil(request.user)
    if perfil and perfil.rol == 'cliente' and perfil.id_cliente:
        mascotas_ids = MascotasVeterinariaPetcube.objects.filter(
            id_cliente=perfil.id_cliente
        ).values_list('id_mascota', flat=True)
        consultas = ConsultasVeterinariaPetcube.objects.filter(
            id_mascota__in=mascotas_ids
        ).order_by('-fecha_consulta')
    else:
        consultas = []
    
    return render(request, 'veterinaria/cliente_consultas.html', {'consultas': consultas})

@login_required
def cliente_detalle_consulta(request, id_consulta):
    perfil = obtener_o_crear_perfil(request.user)
    try:
        if perfil and perfil.rol == 'cliente' and perfil.id_cliente:
            mascotas_ids = MascotasVeterinariaPetcube.objects.filter(
                id_cliente=perfil.id_cliente
            ).values_list('id_mascota', flat=True)
            consulta = ConsultasVeterinariaPetcube.objects.get(
                id_consulta=id_consulta,
                id_mascota__in=mascotas_ids
            )
        else:
            consulta = None
    except ConsultasVeterinariaPetcube.DoesNotExist:
        consulta = None
    except:
        consulta = None
    
    if not consulta:
        return render(request, 'veterinaria/error_permiso.html')
    
    return render(request, 'veterinaria/cliente_detalle_consulta.html', {'consulta': consulta})

@login_required
def cliente_perfil(request):
    perfil = obtener_o_crear_perfil(request.user)
    if perfil and perfil.id_cliente:
        cliente = ClientesVeterinariaPetcube.objects.filter(id_cliente=perfil.id_cliente).first()
        mascotas = MascotasVeterinariaPetcube.objects.filter(id_cliente=perfil.id_cliente)
        mascotas_count = mascotas.count()
        mascotas_ids = mascotas.values_list('id_mascota', flat=True)
        consultas_count = ConsultasVeterinariaPetcube.objects.filter(
            id_mascota__in=mascotas_ids
        ).count()
    else:
        cliente = None
        mascotas = []
        mascotas_count = 0
        consultas_count = 0
    
    return render(request, 'veterinaria/cliente_perfil.html', {
        'cliente': cliente,
        'perfil': perfil,
        'mascotas': mascotas,
        'mascotas_count': mascotas_count,
        'consultas_count': consultas_count
    })

# ==================== PANEL DE ADMINISTRACIÓN ====================
@user_passes_test(es_dueno)
def admin_panel(request):
    empleados = User.objects.filter(perfil__rol__in=['empleado', 'recepcionista']).order_by('username')
    clientes = User.objects.filter(perfil__rol='cliente').order_by('username')
    return render(request, 'veterinaria/admin_panel.html', {
        'empleados': empleados,
        'clientes': clientes
    })

@user_passes_test(es_dueno)
def empleado_nuevo(request):
    if request.method == 'POST':
        empleado = User.objects.create_user(
            username=request.POST.get('username'),
            first_name=request.POST.get('first_name'),
            last_name=request.POST.get('last_name'),
            email=request.POST.get('email'),
            password="veterinario123"  # Contraseña predeterminada
        )

        #  CREAR PERFIL DEL EMPLEADO
        PerfilUsuario.objects.create(
            user=empleado,
            rol=request.POST.get('rol', 'empleado')
        )

        return redirect('admin_panel')

    return render(request, 'veterinaria/empleado_form.html', {
        'titulo': 'Nuevo Empleado',
        'empleado': None
    })

@user_passes_test(es_dueno)
def empleado_editar(request, id_empleado):
    empleado = get_object_or_404(User, id=id_empleado)
    
    if empleado.is_superuser:
        return redirect('/admin/panel/')
    
    if request.method == 'POST':
        empleado.username = request.POST.get('username')
        empleado.first_name = request.POST.get('first_name')
        empleado.last_name = request.POST.get('last_name')
        empleado.email = request.POST.get('email')
        empleado.save()
        try:
            perfil = empleado.perfil
            perfil.rol = request.POST.get('rol', 'empleado')
            perfil.save()
        except PerfilUsuario.DoesNotExist:
            PerfilUsuario.objects.create(
                user=empleado,
                rol=request.POST.get('rol', 'empleado')
            )
        return redirect('admin_panel')
    
    return render(request, 'veterinaria/empleado_form.html', {'titulo': 'Editar Empleado', 'empleado': empleado})

@user_passes_test(es_dueno)
def empleado_eliminar(request, id_empleado):
    empleado = get_object_or_404(User, id=id_empleado)

    #  Eliminar perfil primero
    try:
        empleado.perfil.delete()
    except:
        pass

    #  Luego eliminar usuario
    empleado.delete()

    return redirect('admin_panel')

# ==================== BACKUPS ====================
sql_backup_dir = r'C:\SQLBackups'

@login_required
@requiere_rol(['admin'])
def lista_backups(request):
    backup_dir = r'C:\Users\Alexis\Desktop\django\PetCubeweb\backups'
    backups = []
    
    if os.path.exists(backup_dir):
        for file in os.listdir(backup_dir):
            if file.endswith('.bak'):
                file_path = os.path.join(backup_dir, file)
                backups.append({
                    'nombre': file,
                    'tamaño': round(os.path.getsize(file_path) / (1024*1024), 2),
                    'fecha': datetime.fromtimestamp(os.path.getctime(file_path)).strftime('%Y-%m-%d %H:%M:%S'),
                    'ruta': file_path
                })
    
    backups.sort(key=lambda x: x['fecha'], reverse=True)
    return render(request, 'veterinaria/lista_backups.html', {'backups': backups})

@login_required
@requiere_rol(['admin'])
def crear_backup(request):
    import os
    import shutil
    import pyodbc
    from datetime import datetime

    sql_backup_dir = r'C:\SQLBackups'
    project_backup_dir = r'C:\Users\Alexis\Desktop\django\PetCubeweb\backups'

    os.makedirs(project_backup_dir, exist_ok=True)

    fecha = datetime.now().strftime('%Y%m%d_%H%M%S')
    nombre = f'PetCube_Backup_{fecha}.bak'

    sql_backup_file = os.path.join(sql_backup_dir, nombre)
    project_backup_file = os.path.join(project_backup_dir, nombre)

    conn_str = (
        "DRIVER={ODBC Driver 17 for SQL Server};"
        "SERVER=LAPTOP-EL2DOH7K\\SQLEXPRESS;"
        "DATABASE=PetCube_Veterinaria;"
        "Trusted_Connection=yes;"
    )

    try:
        conn = pyodbc.connect(conn_str, autocommit=True)
        cursor = conn.cursor()

        cursor.execute(
            f"BACKUP DATABASE [PetCube_Veterinaria] "
            f"TO DISK = N'{sql_backup_file}' "
            f"WITH INIT"
        )

        cursor.close()
        conn.close()

        # Copiar al proyecto Django
        if os.path.exists(sql_backup_file):
            shutil.copy2(sql_backup_file, project_backup_file)
        else:
            return render(request, 'veterinaria/error_backup.html', {
                'error': 'El archivo .bak no se generó'
            })

        return redirect('/backups/')

    except Exception as e:
        return render(request, 'veterinaria/error_backup.html', {'error': str(e)})

from django.http import FileResponse, Http404
import os

@login_required
@requiere_rol(['admin'])
def descargar_backup(request, nombre_archivo):
    backup_dir = r'C:\Users\Alexis\Desktop\django\PetCubeweb\backups'
    file_path = os.path.join(backup_dir, nombre_archivo)

    if os.path.exists(file_path):
        return FileResponse(
            open(file_path, 'rb'),
            as_attachment=True,
            filename=nombre_archivo
        )
    else:
        raise Http404("Backup no encontrado")
    
    #============= Cargar Mascotas=================#


@login_required
def mascotas_por_cliente(request, id_cliente):
    mascotas = MascotasVeterinariaPetcube.objects.filter(id_cliente=id_cliente)
    data = [
        {'id': m.id_mascota, 'nombre': m.nombre}
        for m in mascotas
    ]
    return JsonResponse(data, safe=False)

#==========================Mostrar consulta segun el cliente=====================#

@login_required
@requiere_rol(['empleado', 'admin', 'recepcionista'])
def lista_consultas(request):
    perfil = obtener_o_crear_perfil(request.user)
    
    if request.user.is_superuser or (perfil and perfil.rol == 'recepcionista'):
        consultas = ConsultasVeterinariaPetcube.objects.select_related('id_mascota', 'id_veterinario').all()
    else:
        veterinario = VeterinariosVeterinariaPetcube.objects.get(
            correo=request.user.email
        )
        consultas = ConsultasVeterinariaPetcube.objects.select_related('id_mascota', 'id_veterinario').filter(
            id_veterinario=veterinario
        )

    consultas = list(consultas)
    consulta_ids = [consulta.id_consulta for consulta in consultas]
    tratamientos = TratamientosVeterinariaPetcube.objects.filter(id_consulta__id_consulta__in=consulta_ids)
    tratamientos_por_consulta = {}
    for tratamiento in tratamientos:
        consulta_id = tratamiento.id_consulta.id_consulta
        tratamientos_por_consulta.setdefault(consulta_id, []).append(tratamiento)

    for consulta in consultas:
        consulta.tratamientos = tratamientos_por_consulta.get(consulta.id_consulta, [])

    return render(request, 'veterinaria/consultas.html', {
        'consultas': consultas
    })

@login_required
@requiere_rol(['recepcionista', 'admin', 'empleado'])
def lista_ventas(request):
    ventas = VentasVeterinariaPetcube.objects.select_related('id_cliente').order_by('-fecha_venta')
    return render(request, 'veterinaria/ventas.html', {
        'ventas': ventas
    })

@login_required
@requiere_rol(['recepcionista', 'admin', 'empleado'])
def venta_nueva(request):
    clientes = ClientesVeterinariaPetcube.objects.all()

    if request.method == 'POST':
        ultimo = VentasVeterinariaPetcube.objects.order_by('-id_venta').first()
        nuevo_id = ultimo.id_venta + 1 if ultimo else 1

        cliente = ClientesVeterinariaPetcube.objects.get(
            id_cliente=request.POST.get('id_cliente')
        )

        fecha_venta = datetime.strptime(
            request.POST.get('fecha_venta'),
            '%Y-%m-%d'
        ).date()

        subtotal = Decimal(request.POST.get('subtotal'))

        metodo_pago = request.POST.get('metodo_pago')
        estado_venta = request.POST.get('estado_venta')

        venta = VentasVeterinariaPetcube(
            id_venta=nuevo_id,
            id_cliente=cliente,
            fecha_venta=fecha_venta,
            subtotal=subtotal,   
            metodo_pago=metodo_pago,
            estado_venta=estado_venta
        )
        venta.save() 

        return redirect('ventas')

    today = datetime.now().date().isoformat()
    return render(request, 'veterinaria/venta_form.html', {
        'clientes': clientes,
        'today': today
    })

# ==================== FACTURACIÓN ====================

@login_required
@requiere_rol(['admin', 'recepcionista'])
def facturar_venta(request, id_venta):
    venta = get_object_or_404(VentasVeterinariaPetcube, id_venta=id_venta)

    # Evitar doble facturación
    if FacturasVeterinariaPetcube.objects.filter(id_venta=venta).exists():
        return render(request, 'veterinaria/error_permiso.html', {
            'error': 'Esta venta ya fue facturada.'
        })

    if request.method == 'POST':
        nuevo_id_factura = FacturasVeterinariaPetcube.objects.count() + 1

        with connection.cursor() as cursor:
            cursor.execute("""
                EXEC sp_GenerarFacturaConFolio
                    @id_factura = %s,
                    @fecha_factura = %s,
                    @rfc_cliente = %s,
                    @razon_social = %s,
                    @subtotal = %s,
                    @iva = %s,
                    @total = %s,
                    @id_venta = %s,
                    @referencia_pago = %s
            """, [
                nuevo_id_factura,
                date.today(),
                request.POST.get('rfc'),
                request.POST.get('razon_social'),
                venta.subtotal,
                venta.iva,
                venta.total,
                venta.id_venta,
                request.POST.get('referencia_pago')
            ])

            folio = cursor.fetchone()[0]

        # Marcar venta como facturada
        venta.estado_venta = 'Facturada'
        venta.save()

        return render(request, 'veterinaria/factura_generada.html', {
            'folio': folio,
            'venta': venta
        })

    return render(request, 'veterinaria/facturar.html', {
        'venta': venta
    })

