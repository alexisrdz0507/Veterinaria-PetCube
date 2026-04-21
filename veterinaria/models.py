from django.db import models
from decimal import Decimal

# Modelo de Clientes
class ClientesVeterinariaPetcube(models.Model):
    id_cliente = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apellido_paterno = models.CharField(max_length=50)
    apellido_materno = models.CharField(max_length=50)
    telefono = models.CharField(max_length=15)
    correo = models.CharField(max_length=100)
    direccion = models.CharField(max_length=150)
    fecha_registro = models.DateField()
    numero_documento = models.BinaryField(blank=True, null=True)

    def __str__(self):
        return f"{self.nombre} {self.apellido_paterno}"

    class Meta:
         managed = True 
         db_table = 'clientes_veterinaria_petcube'

# Modelo de Especies
class EspeciesVeterinariaPetcube(models.Model):
    id_especie = models.IntegerField(primary_key=True)
    nombre_especie = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=150)

    def __str__(self):
        return self.nombre_especie

    class Meta:
        managed = False
        db_table = 'especies_veterinaria_petcube'

# Modelo de Razas
class RazasVeterinariaPetcube(models.Model):
    id_raza = models.IntegerField(primary_key=True)
    id_especie = models.IntegerField()
    nombre_raza = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=100)

    def __str__(self):
        return self.nombre_raza

    class Meta:
        managed = False
        db_table = 'razas_veterinaria_petcube'

# Modelo de Mascotas
class MascotasVeterinariaPetcube(models.Model):
    id_mascota = models.IntegerField(primary_key=True)
    id_cliente = models.ForeignKey(ClientesVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_cliente')
    id_especie = models.ForeignKey(EspeciesVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_especie')
    id_raza = models.ForeignKey(RazasVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_raza')
    nombre = models.CharField(max_length=50)
    sexo = models.CharField(max_length=50)
    fecha_nacimiento = models.DateField()
    peso = models.DecimalField(max_digits=5, decimal_places=2)

    def __str__(self):
        return self.nombre

    class Meta:
        managed = False
        db_table = 'mascotas_veterinaria_petcube'

# Modelo de Veterinarios
class VeterinariosVeterinariaPetcube(models.Model):
    id_veterinario = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=50)
    apellido_paterno = models.CharField(max_length=50)
    apellido_materno = models.CharField(max_length=50)
    especialidad = models.CharField(max_length=50)
    telefono = models.CharField(max_length=50)
    correo = models.CharField(max_length=50)
    horario = models.CharField(max_length=20)

    def __str__(self):
        return f"{self.nombre} {self.apellido_paterno}"

    class Meta:
        managed = False
        db_table = 'veterinarios_veterinaria_petcube'

# Modelo de Consultas
class ConsultasVeterinariaPetcube(models.Model):
    id_consulta = models.IntegerField(primary_key=True)
    fecha_consulta = models.DateTimeField()
    motivo = models.CharField(max_length=150)
    estado = models.CharField(max_length=20)
    id_mascota = models.ForeignKey(MascotasVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_mascota')
    id_veterinario = models.ForeignKey(VeterinariosVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_veterinario')

    class Meta:
        managed = False
        db_table = 'consultas_veterinaria_petcube'


# Modelo de Expedientes
class ExpedientesVeterinariaPetcube(models.Model):
    id_expediente = models.IntegerField(primary_key=True)
    id_mascota = models.ForeignKey(MascotasVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_mascota')
    fecha_registro = models.DateField()
    antecedentes = models.CharField(max_length=250)
    padecimientos = models.CharField(max_length=250)
    notas_medicas = models.CharField(max_length=250)

    def __str__(self):
        return f"Expediente {self.id_expediente}"

    class Meta:
        managed = False
        db_table = 'expedientes_veterinaria_petcube'

# Modelo de Servicios
class ServiciosVeterinariaPetcube(models.Model):
    id_servicio = models.IntegerField(primary_key=True)
    nombre_servicio = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=250)
    precio = models.DecimalField(max_digits=8, decimal_places=2)
    estado_servicio = models.CharField(max_length=20)

    def __str__(self):
        return self.nombre_servicio

    class Meta:
        managed = False
        db_table = 'servicios_veterinaria_petcube'

# Modelo de Vacunas
class VacunasVeterinariaPetcube(models.Model):
    id_vacuna = models.IntegerField(primary_key=True)
    nombre_vacuna = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=250)
    dosis_recomendada = models.CharField(max_length=50)
    periocidad = models.CharField(max_length=50)
    precio = models.DecimalField(max_digits=8, decimal_places=2)

    def __str__(self):
        return self.nombre_vacuna

    class Meta:
        managed = False
        db_table = 'vacunas_veterinaria_petcube'

# Modelo de Productos
class ProductosVeterinariaPetcube(models.Model):
    id_producto = models.IntegerField(primary_key=True)
    nombre_producto = models.CharField(max_length=80)
    categoria = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=250)
    stock = models.IntegerField()
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_caducidad = models.DateField()
    estado_producto = models.CharField(max_length=20)

    def __str__(self):
        return self.nombre_producto

    class Meta:
        managed = False
        db_table = 'productos_veterinaria_petcube'

# Modelo de Citas
class CitasVeterinariaPetcube(models.Model):
    id_cita = models.IntegerField(primary_key=True)
    id_mascota = models.ForeignKey(MascotasVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_mascota')
    id_veterinario = models.ForeignKey(VeterinariosVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_veterinario')
    fecha_cita = models.DateField()
    hora_cita = models.TimeField()
    motivo = models.CharField(max_length=100)
    estado_cita = models.CharField(max_length=100)
    observaciones = models.CharField(max_length=250)

    def __str__(self):
        return f"Cita {self.id_cita} - {self.fecha_cita} {self.hora_cita}"

    class Meta:
        managed = False
        db_table = 'citas_veterinaria_petcube'

# Modelo de Vacunaciones de Mascotas
class MascotasVacunasVeterinariaPetcube(models.Model):
    id_aplicacion = models.IntegerField(primary_key=True)
    fecha_aplicacion = models.DateField()
    proxima_aplicacion = models.DateField()
    observaciones = models.CharField(max_length=250)
    id_mascota = models.ForeignKey(MascotasVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_mascota')
    id_vacuna = models.ForeignKey(VacunasVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_vacuna')
    id_veterinario = models.ForeignKey(VeterinariosVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_veterinario')

    def __str__(self):
        return f"Aplicación {self.id_aplicacion}"

    class Meta:
        managed = False
        db_table = 'mascotas_vacunas_veterinaria_petcube'

# Modelo de Ventas

class VentasVeterinariaPetcube(models.Model):
    id_venta = models.IntegerField(primary_key=True)
    id_cliente = models.ForeignKey(ClientesVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_cliente')
    fecha_venta = models.DateField()
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)
    iva = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    total = models.DecimalField(max_digits=10, decimal_places=2, editable=False)
    metodo_pago = models.CharField(max_length=250)
    estado_venta = models.CharField(max_length=250)

    def save(self, *args, **kwargs):
        self.iva = self.subtotal * Decimal('0.16')
        self.total = self.subtotal + self.iva
        super().save(*args, **kwargs)

    def __str__(self):
        return f"Venta {self.id_venta}"

    class Meta:
        managed = False
        db_table = 'ventas_veterinaria_petcube'


# Modelo de Detalle de Ventas
class DetalleVentasVeterinariaPetcube(models.Model):
    id_detalle_venta = models.IntegerField(primary_key=True)
    precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
    importe = models.DecimalField(max_digits=10, decimal_places=2)
    id_venta = models.ForeignKey(VentasVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_venta')
    id_producto = models.ForeignKey(ProductosVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_producto')

    def __str__(self):
        return f"Detalle {self.id_detalle_venta}"

    class Meta:
        managed = False
        db_table = 'detalle_ventas_veterinaria_petcube'

# Modelo de Facturas
class FacturasVeterinariaPetcube(models.Model):
    id_factura = models.IntegerField(primary_key=True)
    folio = models.CharField(max_length=100)
    fecha_factura = models.DateField()
    rfc_cliente = models.CharField(max_length=20)
    razon_social = models.CharField(max_length=100)
    subtotal = models.DecimalField(max_digits=10, decimal_places=2)
    iva = models.DecimalField(max_digits=10, decimal_places=2)
    total = models.DecimalField(max_digits=10, decimal_places=2)
    id_venta = models.ForeignKey(VentasVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_venta')
    referencia_pago = models.BinaryField(blank=True, null=True)

    def __str__(self):
        return self.folio

    class Meta:
        managed = False
        db_table = 'facturas_veterinaria_petcube'

# Modelo de Tratamientos
class TratamientosVeterinariaPetcube(models.Model):
    id_tratamiento = models.IntegerField(primary_key=True)
    id_consulta = models.ForeignKey(ConsultasVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_consulta')
    nombre_tratamiento = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=255)
    medicamento = models.CharField(max_length=100)
    dosis = models.CharField(max_length=50)
    duracion_dias = models.IntegerField()
    observaciones = models.CharField(max_length=255)
    diagnostico = models.BinaryField(blank=True, null=True)
    tratamiento = models.BinaryField(blank=True, null=True)

    def __str__(self):
        return self.nombre_tratamiento

    class Meta:
        managed = False
        db_table = 'tratamientos_veterinaria_petcube'

# Modelo de seguridad para clientes
class ClientesSeguridadVeterinariaPetcube(models.Model):
    id_cliente = models.ForeignKey(ClientesVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_cliente', primary_key=True)
    telefono_cifrado = models.BinaryField()
    correo_cifrado = models.BinaryField()
    direccion_cifrada = models.BinaryField()

    class Meta:
        managed = False
        db_table = 'clientes_seguridad_veterinaria_petcube'

# Modelo de seguridad para tratamientos
class TratamientosSeguridadVeterinariaPetcube(models.Model):
    id_tratamiento = models.ForeignKey(TratamientosVeterinariaPetcube, on_delete=models.DO_NOTHING, db_column='id_tratamiento', primary_key=True)
    medicamento_cifrado = models.BinaryField()
    dosis_cifrada = models.BinaryField()
    observaciones_cifradas = models.BinaryField()

    class Meta:
        managed = False
        db_table = 'tratamientos_seguridad_veterinaria_petcube'

# Modelo de Errores
class ErroresVeterinariaPetcube(models.Model):
    id_error = models.AutoField(primary_key=True)
    numero_error = models.IntegerField()
    severidad_error = models.IntegerField()
    estado_error = models.IntegerField()
    procedimiento_error = models.CharField(max_length=200)
    linea_error = models.IntegerField()
    mensaje_error = models.CharField(max_length=4000)
    fecha_error = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'errores_veterinaria_petcube'

# Modelo para perfiles de usuario (ROLES)
class PerfilUsuario(models.Model):
    user = models.OneToOneField('auth.User', on_delete=models.CASCADE, related_name='perfil')
    rol = models.CharField(max_length=20, default='cliente')
    id_cliente = models.IntegerField(null=True, blank=True)

    class Meta:
        managed = False
        db_table = 'perfil_usuario'