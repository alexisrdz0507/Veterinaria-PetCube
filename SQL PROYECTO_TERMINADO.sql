CREATE DATABASE PetCube_Veterinaria

USE PetCube_Veterinaria

IF OBJECT_ID('facturas_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE facturas_veterinaria_petcube;
IF OBJECT_ID('detalle_ventas_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE detalle_ventas_veterinaria_petcube;
IF OBJECT_ID('ventas_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE ventas_veterinaria_petcube;
IF OBJECT_ID('mascotas_vacunas_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE mascotas_vacunas_veterinaria_petcube;
IF OBJECT_ID('tratamientos_seguridad_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE tratamientos_seguridad_veterinaria_petcube;
IF OBJECT_ID('clientes_seguridad_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE clientes_seguridad_veterinaria_petcube;
IF OBJECT_ID('tratamientos_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE tratamientos_veterinaria_petcube;
IF OBJECT_ID('consultas_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE consultas_veterinaria_petcube;
IF OBJECT_ID('citas_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE citas_veterinaria_petcube;
IF OBJECT_ID('expedientes_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE expedientes_veterinaria_petcube;
IF OBJECT_ID('productos_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE productos_veterinaria_petcube;
IF OBJECT_ID('vacunas_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE vacunas_veterinaria_petcube;
IF OBJECT_ID('servicios_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE servicios_veterinaria_petcube;
IF OBJECT_ID('mascotas_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE mascotas_veterinaria_petcube;
IF OBJECT_ID('veterinarios_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE veterinarios_veterinaria_petcube;
IF OBJECT_ID('razas_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE razas_veterinaria_petcube;
IF OBJECT_ID('especies_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE especies_veterinaria_petcube;
IF OBJECT_ID('clientes_veterinaria_petcube', 'U') IS NOT NULL 
DROP TABLE clientes_veterinaria_petcube;
IF OBJECT_ID('errores_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE errores_veterinaria_petcube;

IF OBJECT_ID('Auditoria_clientes_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_clientes_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_clientes_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_clientes_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_clientes_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_clientes_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_clientes_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_clientes_veterinaria_petcube;

IF OBJECT_ID('Auditoria_especies_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_especies_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_especies_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_especies_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_especies_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_especies_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_especies_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_especies_veterinaria_petcube;

IF OBJECT_ID('Auditoria_razas_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_razas_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_razas_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_razas_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_razas_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_razas_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_razas_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_razas_veterinaria_petcube;

IF OBJECT_ID('Auditoria_veterinarios_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_veterinarios_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_veterinarios_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_veterinarios_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_veterinarios_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_veterinarios_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_veterinarios_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_veterinarios_veterinaria_petcube;

IF OBJECT_ID('Auditoria_mascotas_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_mascotas_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_mascotas_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_mascotas_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_mascotas_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_mascotas_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_mascotas_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_mascotas_veterinaria_petcube;

IF OBJECT_ID('Auditoria_expedientes_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_expedientes_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_expedientes_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_expedientes_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_expedientes_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_expedientes_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_expedientes_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_expedientes_veterinaria_petcube;

IF OBJECT_ID('Auditoria_servicios_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_servicios_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_servicios_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_servicios_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_servicios_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_servicios_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_servicios_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_servicios_veterinaria_petcube;

IF OBJECT_ID('Auditoria_vacunas_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_vacunas_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_vacunas_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_vacunas_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_vacunas_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_vacunas_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_vacunas_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_vacunas_veterinaria_petcube;

IF OBJECT_ID('Auditoria_productos_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_productos_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_productos_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_productos_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_productos_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_productos_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_productos_veterinaria_petcube','U') IS NOT NULL DROP 
TABLE Auditoria_productos_veterinaria_petcube;

IF OBJECT_ID('Auditoria_citas_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_citas_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_citas_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_citas_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_citas_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_citas_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_citas_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_citas_veterinaria_petcube;

IF OBJECT_ID('Auditoria_consultas_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_consultas_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_consultas_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_consultas_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_consultas_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_consultas_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_consultas_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_consultas_veterinaria_petcube;

IF OBJECT_ID('Auditoria_mascotas_vacunas_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_mascotas_vacunas_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_mascotas_vacunas_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_mascotas_vacunas_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_mascotas_vacunas_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_mascotas_vacunas_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_mascotas_vacunas_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_mascotas_vacunas_veterinaria_petcube;

IF OBJECT_ID('Auditoria_ventas_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_ventas_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_ventas_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_ventas_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_ventas_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_ventas_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_ventas_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_ventas_veterinaria_petcube;

IF OBJECT_ID('Auditoria_detalle_ventas_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_detalle_ventas_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_detalle_ventas_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_detalle_ventas_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_detalle_ventas_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_detalle_ventas_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_detalle_ventas_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_detalle_ventas_veterinaria_petcube;

IF OBJECT_ID('Auditoria_facturas_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_facturas_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_facturas_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_facturas_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_facturas_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_facturas_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_facturas_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_facturas_veterinaria_petcube;

IF OBJECT_ID('Auditoria_tratamientos_veterinaria_petcube_Delete','U') IS NOT NULL 
DROP TABLE Auditoria_tratamientos_veterinaria_petcube_Delete;
IF OBJECT_ID('Auditoria_tratamientos_veterinaria_petcube_Update','U') IS NOT NULL 
DROP TABLE Auditoria_tratamientos_veterinaria_petcube_Update;
IF OBJECT_ID('Auditoria_tratamientos_veterinaria_petcube_Insert','U') IS NOT NULL 
DROP TABLE Auditoria_tratamientos_veterinaria_petcube_Insert;
IF OBJECT_ID('Auditoria_tratamientos_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE Auditoria_tratamientos_veterinaria_petcube;

IF OBJECT_ID('tr_consultas_insert','TR') IS NOT NULL 
DROP TRIGGER tr_consultas_insert;
IF OBJECT_ID('tr_consultas_update','TR') IS NOT NULL 
DROP TRIGGER tr_consultas_update;
IF OBJECT_ID('tr_consultas_delete','TR') IS NOT NULL 
DROP TRIGGER tr_consultas_delete;
IF OBJECT_ID('tr_tratamientos_insert','TR') IS NOT NULL 
DROP TRIGGER tr_tratamientos_insert;
IF OBJECT_ID('tr_tratamientos_update','TR') IS NOT NULL 
DROP TRIGGER tr_tratamientos_update;
IF OBJECT_ID('tr_tratamientos_delete','TR') IS NOT NULL 
DROP TRIGGER tr_tratamientos_delete;
IF OBJECT_ID('tr_facturas_insert','TR') IS NOT NULL 
DROP TRIGGER tr_facturas_insert;
IF OBJECT_ID('tr_facturas_update','TR') IS NOT NULL 
DROP TRIGGER tr_facturas_update;
IF OBJECT_ID('tr_facturas_delete','TR') IS NOT NULL 
DROP TRIGGER tr_facturas_delete;

IF OBJECT_ID('sp_RegistrarDuenoCifrado','P') IS NOT NULL 
DROP PROCEDURE sp_RegistrarDuenoCifrado;
IF OBJECT_ID('sp_RegistrarConsulta','P') IS NOT NULL DROP 
PROCEDURE sp_RegistrarConsulta;
IF OBJECT_ID('sp_GenerarTratamientoCifrado','P') IS NOT NULL 
DROP PROCEDURE sp_GenerarTratamientoCifrado;
IF OBJECT_ID('sp_ReportesConsultasPorVeterinario','P') IS NOT NULL
 DROP PROCEDURE sp_ReportesConsultasPorVeterinario;
IF OBJECT_ID('sp_ProcesoCompletoConsultaTratamientoFactura','P') IS NOT NULL 
DROP PROCEDURE sp_ProcesoCompletoConsultaTratamientoFactura;
IF OBJECT_ID('sp_GenerarFacturaConFolio','P') IS NOT NULL 
DROP PROCEDURE sp_GenerarFacturaConFolio;
IF OBJECT_ID('sp_ClasificacionClientesFrecuentes','P') IS NOT NULL 
DROP PROCEDURE sp_ClasificacionClientesFrecuentes;
IF OBJECT_ID('sp_RankingVeterinariosConsultas','P') IS NOT NULL 
DROP PROCEDURE sp_RankingVeterinariosConsultas;
IF OBJECT_ID('sp_InsertarConsultaConManejoErrores','P') IS NOT NULL 
DROP PROCEDURE sp_InsertarConsultaConManejoErrores;

IF OBJECT_ID('vw_SistemaCompleto_PetCube','V') IS NOT NULL 
DROP VIEW vw_SistemaCompleto_PetCube;

IF OBJECT_ID('Pivot_Consultas_Por_Mes_PetCube','U') IS NOT NULL 
DROP TABLE Pivot_Consultas_Por_Mes_PetCube;
IF OBJECT_ID('clientes_frecuentes_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE clientes_frecuentes_veterinaria_petcube;
IF OBJECT_ID('clientes_no_frecuentes_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE clientes_no_frecuentes_veterinaria_petcube;
IF OBJECT_ID('clientes_generales_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE clientes_generales_veterinaria_petcube;
IF OBJECT_ID('clientes_sensibles_veterinaria_petcube','U') IS NOT NULL 
DROP TABLE clientes_sensibles_veterinaria_petcube;

IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'Indice_clientes_correo' AND object_id = OBJECT_ID('clientes_veterinaria_petcube')) 
DROP INDEX Indice_clientes_correo ON clientes_veterinaria_petcube;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'Indice_consultas_fecha_consulta' AND object_id = OBJECT_ID('consultas_veterinaria_petcube')) 
DROP INDEX Indice_consultas_fecha_consulta ON consultas_veterinaria_petcube;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'Indice_consultas_estado' AND object_id = OBJECT_ID('consultas_veterinaria_petcube')) 
DROP INDEX Indice_consultas_estado ON consultas_veterinaria_petcube;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'Indice_citas_fecha_cita' AND object_id = OBJECT_ID('citas_veterinaria_petcube')) 
DROP INDEX Indice_citas_fecha_cita ON citas_veterinaria_petcube;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'Indice_citas_estado_cita' AND object_id = OBJECT_ID('citas_veterinaria_petcube')) 
DROP INDEX Indice_citas_estado_cita ON citas_veterinaria_petcube;
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'Indice_facturas_fecha_factura' AND object_id = OBJECT_ID('facturas_veterinaria_petcube')) 
DROP INDEX Indice_facturas_fecha_factura ON facturas_veterinaria_petcube;

IF OBJECT_ID('Seq_Folio_Facturas_PetCube','SO') IS NOT NULL 
DROP SEQUENCE Seq_Folio_Facturas_PetCube;
IF OBJECT_ID('Seq_Consulta_PetCube','SO') IS NOT NULL 
DROP SEQUENCE Seq_Consulta_PetCube;
IF OBJECT_ID('Seq_Tratamiento_PetCube','SO') IS NOT NULL 
DROP SEQUENCE Seq_Tratamiento_PetCube;

IF EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = 'ClaveSimetricaDatos') 
DROP SYMMETRIC KEY ClaveSimetricaDatos;
IF EXISTS (SELECT * FROM sys.certificates WHERE name = 'CertificadoSeguridadDatos') 
DROP CERTIFICATE CertificadoSeguridadDatos;
IF EXISTS (SELECT * FROM sys.symmetric_keys WHERE name = '##MS_DatabaseMasterKey##') 
DROP MASTER KEY;

CREATE TABLE clientes_veterinaria_petcube (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    fecha_registro DATE NOT NULL,
    numero_documento VARBINARY(MAX)
);

CREATE TABLE especies_veterinaria_petcube (
    id_especie INT PRIMARY KEY,
    nombre_especie VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NOT NULL
);

CREATE TABLE razas_veterinaria_petcube(
    id_raza INT PRIMARY KEY,
    id_especie INT,
    nombre_raza VARCHAR(50),
    descripcion VARCHAR(100),
    FOREIGN KEY (id_especie) references especies_veterinaria_petcube(id_especie)
);

CREATE TABLE veterinarios_veterinaria_petcube (
    id_veterinario INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    especialidad VARCHAR(50),
    cedula_profesional VARBINARY(MAX),
    telefono VARCHAR(50),
    correo VARCHAR(50),
    horario VARCHAR(20),
    contrasena VARBINARY(MAX)
);

CREATE TABLE mascotas_veterinaria_petcube(
    id_mascota INT PRIMARY KEY,
    id_cliente INT,
    id_especie INT,
    id_raza INT,
    nombre VARCHAR(50),
    sexo VARCHAR(50),
    fecha_nacimiento DATE,
    peso DECIMAL(5,2),
    FOREIGN KEY (id_cliente) references clientes_veterinaria_petcube(id_cliente),
    FOREIGN KEY (id_especie) references especies_veterinaria_petcube(id_especie),
    FOREIGN KEY (id_raza) references razas_veterinaria_petcube(id_raza)
);

CREATE TABLE expedientes_veterinaria_petcube(
    id_expediente INT PRIMARY KEY,
    id_mascota INT,
    fecha_registro DATE,
    antecedentes VARCHAR(250),
    padecimientos VARCHAR(250),
    notas_medicas VARCHAR(250),
    FOREIGN KEY (id_mascota) references mascotas_veterinaria_petcube(id_mascota)
);

CREATE TABLE servicios_veterinaria_petcube(
    id_servicio INT PRIMARY KEY,
    nombre_servicio VARCHAR(100),
    descripcion VARCHAR(250),
    precio DECIMAL(8,2),
    estado_servicio VARCHAR(20)
);

CREATE TABLE vacunas_veterinaria_petcube(
    id_vacuna INT PRIMARY KEY,
    nombre_vacuna VARCHAR(50),
    descripcion VARCHAR(250),
    dosis_recomendada VARCHAR(50),
    periocidad VARCHAR(50),
    precio DECIMAL(8,2)
);

CREATE TABLE productos_veterinaria_petcube(
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(80),
    categoria VARCHAR(50),
    descripcion VARCHAR(250),
    stock INT,
    precio_unitario DECIMAL(10,2),
    fecha_caducidad DATE,
    estado_producto VARCHAR(20)
);

CREATE TABLE citas_veterinaria_petcube(
    id_cita INT PRIMARY KEY,
    id_mascota INT,
    id_veterinario INT,
    fecha_cita DATE,
    hora_cita TIME,
    motivo VARCHAR(100),
    estado_cita VARCHAR(100),
    observaciones VARCHAR(250),
    FOREIGN KEY (id_mascota) references mascotas_veterinaria_petcube(id_mascota),
    FOREIGN KEY (id_veterinario) references veterinarios_veterinaria_petcube(id_veterinario)
);

CREATE TABLE consultas_veterinaria_petcube(
    id_consulta INT PRIMARY KEY,
    fecha_consulta DATETIME,
    motivo VARCHAR(150),
    estado VARCHAR(20),
    id_mascota INT,
    id_veterinario INT,
    FOREIGN KEY (id_mascota) references mascotas_veterinaria_petcube(id_mascota),
    FOREIGN KEY (id_veterinario) references veterinarios_veterinaria_petcube(id_veterinario)
);

CREATE TABLE mascotas_vacunas_veterinaria_petcube(
    id_aplicacion INT PRIMARY KEY,
    fecha_aplicacion DATE,
    proxima_aplicacion DATE,
    observaciones VARCHAR(250),
    id_mascota INT,
    id_vacuna INT,
    id_veterinario INT,
    FOREIGN KEY (id_mascota) references mascotas_veterinaria_petcube(id_mascota),
    FOREIGN KEY (id_vacuna) references vacunas_veterinaria_petcube(id_vacuna),
    FOREIGN KEY (id_veterinario) references veterinarios_veterinaria_petcube(id_veterinario)
);

CREATE TABLE ventas_veterinaria_petcube(
    id_venta INT PRIMARY KEY,
    id_cliente INT,
    fecha_venta DATE,
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(8,2),
    metodo_pago VARCHAR(250),
    estado_venta VARCHAR(250),
    FOREIGN KEY (id_cliente) references clientes_veterinaria_petcube(id_cliente)
);

CREATE TABLE detalle_ventas_veterinaria_petcube(
    id_detalle_venta INT PRIMARY KEY,
    precio_unitario DECIMAL(10,2),
    importe DECIMAL(10,2),
    id_venta INT,
    id_producto INT,
    FOREIGN KEY (id_venta) references ventas_veterinaria_petcube(id_venta),
    FOREIGN KEY (id_producto) references productos_veterinaria_petcube(id_producto)
);

CREATE TABLE facturas_veterinaria_petcube (
    id_factura INT PRIMARY KEY,
    folio VARCHAR(100),
    fecha_factura DATE,
    rfc_cliente VARCHAR(20),
    razon_social VARCHAR(100),
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(10,2),
    id_venta INT,
    referencia_pago VARBINARY(MAX),
    FOREIGN KEY (id_venta) references ventas_veterinaria_petcube(id_venta)
);

CREATE TABLE tratamientos_veterinaria_petcube (
    id_tratamiento INT PRIMARY KEY,
    id_consulta INT,
    nombre_tratamiento VARCHAR(100),
    descripcion VARCHAR(255),
    medicamento VARCHAR(100),
    dosis VARCHAR(50),
    duracion_dias INT,
    observaciones VARCHAR(255),
    diagnostico VARBINARY(MAX),
    tratamiento VARBINARY(MAX),
    FOREIGN KEY (id_consulta) references consultas_veterinaria_petcube(id_consulta)
);

CREATE TABLE clientes_seguridad_veterinaria_petcube (
    id_cliente INT PRIMARY KEY,
    telefono_cifrado VARBINARY(MAX),
    correo_cifrado VARBINARY(MAX),
    direccion_cifrada VARBINARY(MAX),
    FOREIGN KEY (id_cliente) references clientes_veterinaria_petcube(id_cliente)
);

CREATE TABLE tratamientos_seguridad_veterinaria_petcube (
    id_tratamiento INT PRIMARY KEY,
    medicamento_cifrado VARBINARY(MAX),
    dosis_cifrada VARBINARY(MAX),
    observaciones_cifradas VARBINARY(MAX),
    FOREIGN KEY (id_tratamiento) references tratamientos_veterinaria_petcube(id_tratamiento)
);

------------------------------------------------------------AUDITORIAS-----------------------------------------------------------------

CREATE TABLE Auditoria_clientes_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    direccion VARCHAR(150),
    fecha_registro DATE,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_clientes_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    direccion VARCHAR(150),
    fecha_registro DATE,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_clientes_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    direccion VARCHAR(150),
    fecha_registro DATE,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_clientes_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    direccion VARCHAR(150),
    fecha_registro DATE,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_especies_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_especie INT,
    nombre_especie VARCHAR(50),
    descripcion VARCHAR(150),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_especies_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_especie INT,
    nombre_especie VARCHAR(50),
    descripcion VARCHAR(150),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_especies_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_especie INT,
    nombre_especie VARCHAR(50),
    descripcion VARCHAR(150),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_especies_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_especie INT,
    nombre_especie VARCHAR(50),
    descripcion VARCHAR(150),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_razas_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_raza INT,
    id_especie INT,
    nombre_raza VARCHAR(50),
    descripcion VARCHAR(150),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_razas_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_raza INT,
    id_especie INT,
    nombre_raza VARCHAR(50),
    descripcion VARCHAR(150),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_razas_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_raza INT,
    id_especie INT,
    nombre_raza VARCHAR(50),
    descripcion VARCHAR(150),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_razas_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_raza INT,
    id_especie INT,
    nombre_raza VARCHAR(50),
    descripcion VARCHAR(150),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_veterinarios_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_veterinario INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    cedula_profesional VARBINARY(MAX),
    especialidad VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    horario VARCHAR(100),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_veterinarios_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_veterinario INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    cedula_profesional VARBINARY(MAX),
    especialidad VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    horario VARCHAR(100),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_veterinarios_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_veterinario INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    cedula_profesional VARBINARY(MAX),
    especialidad VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    horario VARCHAR(100),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_veterinarios_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_veterinario INT,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    cedula_profesional VARBINARY(MAX),
    especialidad VARCHAR(50),
    telefono VARCHAR(15),
    correo VARCHAR(100),
    horario VARCHAR(100),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_mascotas_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_mascota INT,
    id_cliente INT,
    id_especie INT,
    id_raza INT,
    nombre VARCHAR(50),
    sexo VARCHAR(50),
    fecha_nacimiento DATE,
    peso DECIMAL(5,2),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_mascotas_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_mascota INT,
    id_cliente INT,
    id_especie INT,
    id_raza INT,
    nombre VARCHAR(50),
    sexo VARCHAR(50),
    fecha_nacimiento DATE,
    peso DECIMAL(5,2),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_mascotas_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_mascota INT,
    id_cliente INT,
    id_especie INT,
    id_raza INT,
    nombre VARCHAR(50),
    sexo VARCHAR(50),
    fecha_nacimiento DATE,
    peso DECIMAL(5,2),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_mascotas_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_mascota INT,
    id_cliente INT,
    id_especie INT,
    id_raza INT,
    nombre VARCHAR(50),
    sexo VARCHAR(50),
    fecha_nacimiento DATE,
    peso DECIMAL(5,2),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_expedientes_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_expediente INT,
    id_mascota INT,
    fecha_registro DATE,
    antecedentes VARCHAR(255),
    padecimientos VARCHAR(255),
    notas_medicas VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_expedientes_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_expediente INT,
    id_mascota INT,
    fecha_registro DATE,
    antecedentes VARCHAR(255),
    padecimientos VARCHAR(255),
    notas_medicas VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_expedientes_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_expediente INT,
    id_mascota INT,
    fecha_registro DATE,
    antecedentes VARCHAR(255),
    padecimientos VARCHAR(255),
    notas_medicas VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_expedientes_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_expediente INT,
    id_mascota INT,
    fecha_registro DATE,
    antecedentes VARCHAR(255),
    padecimientos VARCHAR(255),
    notas_medicas VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_servicios_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_servicio INT,
    nombre_servicio VARCHAR(100),
    descripcion VARCHAR(255),
    precio DECIMAL(8,2),
    estado_servicio VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_servicios_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_servicio INT,
    nombre_servicio VARCHAR(100),
    descripcion VARCHAR(255),
    precio DECIMAL(8,2),
    estado_servicio VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_servicios_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_servicio INT,
    nombre_servicio VARCHAR(100),
    descripcion VARCHAR(255),
    precio DECIMAL(8,2),
    estado_servicio VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_servicios_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_servicio INT,
    nombre_servicio VARCHAR(100),
    descripcion VARCHAR(255),
    precio DECIMAL(8,2),
    estado_servicio VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_vacunas_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_vacuna INT,
    nombre_vacuna VARCHAR(100),
    descripcion VARCHAR(255),
    dosis_recomendada VARCHAR(50),
    periodicidad VARCHAR(50),
    precio DECIMAL(8,2),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_vacunas_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_vacuna INT,
    nombre_vacuna VARCHAR(100),
    descripcion VARCHAR(255),
    dosis_recomendada VARCHAR(50),
    periodicidad VARCHAR(50),
    precio DECIMAL(8,2),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_vacunas_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_vacuna INT,
    nombre_vacuna VARCHAR(100),
    descripcion VARCHAR(255),
    dosis_recomendada VARCHAR(50),
    periodicidad VARCHAR(50),
    precio DECIMAL(8,2),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_vacunas_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_vacuna INT,
    nombre_vacuna VARCHAR(100),
    descripcion VARCHAR(255),
    dosis_recomendada VARCHAR(50),
    periodicidad VARCHAR(50),
    precio DECIMAL(8,2),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_productos_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    descripcion VARCHAR(255),
    stock INT,
    precio_unitario DECIMAL(10,2),
    fecha_caducidad DATE,
    estado_producto VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_productos_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    descripcion VARCHAR(255),
    stock INT,
    precio_unitario DECIMAL(10,2),
    fecha_caducidad DATE,
    estado_producto VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_productos_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    descripcion VARCHAR(255),
    stock INT,
    precio_unitario DECIMAL(10,2),
    fecha_caducidad DATE,
    estado_producto VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_productos_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT,
    nombre_producto VARCHAR(100),
    categoria VARCHAR(50),
    descripcion VARCHAR(255),
    stock INT,
    precio_unitario DECIMAL(10,2),
    fecha_caducidad DATE,
    estado_producto VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_citas_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_cita INT,
    id_mascota INT,
    id_veterinario INT,
    fecha_cita DATE,
    hora_cita TIME,
    motivo VARCHAR(150),
    estado_cita VARCHAR(20),
    observaciones VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_citas_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_cita INT,
    id_mascota INT,
    id_veterinario INT,
    fecha_cita DATE,
    hora_cita TIME,
    motivo VARCHAR(150),
    estado_cita VARCHAR(20),
    observaciones VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_citas_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_cita INT,
    id_mascota INT,
    id_veterinario INT,
    fecha_cita DATE,
    hora_cita TIME,
    motivo VARCHAR(150),
    estado_cita VARCHAR(20),
    observaciones VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_citas_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_cita INT,
    id_mascota INT,
    id_veterinario INT,
    fecha_cita DATE,
    hora_cita TIME,
    motivo VARCHAR(150),
    estado_cita VARCHAR(20),
    observaciones VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_consultas_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_consulta INT,
    fecha_consulta DATETIME,
    motivo VARCHAR(150),
    estado VARCHAR(20),
    id_mascota INT,
    id_veterinario INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_consultas_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_consulta INT,
    fecha_consulta DATETIME,
    motivo VARCHAR(150),
    estado VARCHAR(20),
    id_mascota INT,
    id_veterinario INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_consultas_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_consulta INT,
    fecha_consulta DATETIME,
    motivo VARCHAR(150),
    estado VARCHAR(20),
    id_mascota INT,
    id_veterinario INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_consultas_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_consulta INT,
    fecha_consulta DATETIME,
    motivo VARCHAR(150),
    estado VARCHAR(20),
    id_mascota INT,
    id_veterinario INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_mascotas_vacunas_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_aplicacion INT,
    id_mascota INT,
    id_vacuna INT,
    id_veterinario INT,
    fecha_aplicacion DATE,
    proxima_aplicacion DATE,
    observaciones VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_mascotas_vacunas_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_aplicacion INT,
    id_mascota INT,
    id_vacuna INT,
    id_veterinario INT,
    fecha_aplicacion DATE,
    proxima_aplicacion DATE,
    observaciones VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_mascotas_vacunas_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_aplicacion INT,
    id_mascota INT,
    id_vacuna INT,
    id_veterinario INT,
    fecha_aplicacion DATE,
    proxima_aplicacion DATE,
    observaciones VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_mascotas_vacunas_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_aplicacion INT,
    id_mascota INT,
    id_vacuna INT,
    id_veterinario INT,
    fecha_aplicacion DATE,
    proxima_aplicacion DATE,
    observaciones VARCHAR(255),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_ventas_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_venta INT,
    id_cliente INT,
    fecha_venta DATE,
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    estado_venta VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_ventas_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_venta INT,
    id_cliente INT,
    fecha_venta DATE,
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    estado_venta VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_ventas_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_venta INT,
    id_cliente INT,
    fecha_venta DATE,
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    estado_venta VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_ventas_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_venta INT,
    id_cliente INT,
    fecha_venta DATE,
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(10,2),
    metodo_pago VARCHAR(50),
    estado_venta VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_detalle_ventas_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_detalle_venta INT,
    precio_unitario DECIMAL(10,2),
    importe DECIMAL(10,2),
    id_venta INT,
    id_producto INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_detalle_ventas_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_detalle_venta INT,
    precio_unitario DECIMAL(10,2),
    importe DECIMAL(10,2),
    id_venta INT,
    id_producto INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_detalle_ventas_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_detalle_venta INT,
    precio_unitario DECIMAL(10,2),
    importe DECIMAL(10,2),
    id_venta INT,
    id_producto INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_detalle_ventas_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_detalle_venta INT,
    precio_unitario DECIMAL(10,2),
    importe DECIMAL(10,2),
    id_venta INT,
    id_producto INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_facturas_veterinaria_petcube(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_factura INT,
    folio VARCHAR(100),
    fecha_factura DATE,
    rfc_cliente VARCHAR(20),
    razon_social VARCHAR(100),
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(10,2),
    id_venta INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_facturas_veterinaria_petcube_Insert(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_factura INT,
    folio VARCHAR(100),
    fecha_factura DATE,
    rfc_cliente VARCHAR(20),
    razon_social VARCHAR(100),
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(10,2),
    id_venta INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_facturas_veterinaria_petcube_Update(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_factura INT,
    folio VARCHAR(100),
    fecha_factura DATE,
    rfc_cliente VARCHAR(20),
    razon_social VARCHAR(100),
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(10,2),
    id_venta INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_facturas_veterinaria_petcube_Delete(
    IdLog INT IDENTITY(1,1) PRIMARY KEY,
    id_factura INT,
    folio VARCHAR(100),
    fecha_factura DATE,
    rfc_cliente VARCHAR(20),
    razon_social VARCHAR(100),
    subtotal DECIMAL(10,2),
    iva DECIMAL(10,2),
    total DECIMAL(10,2),
    id_venta INT,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_tratamientos_veterinaria_petcube (
    idLog INT IDENTITY (1,1) PRIMARY KEY,
    id_tratamiento INT,
    id_consulta INT,
    nombre_tratamiento VARCHAR(100),
    descripcion VARCHAR(255),
    medicamento VARCHAR(100),
    dosis VARCHAR(50),
    duracion_dias INT,
    observaciones VARCHAR(255),
    Fecharegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_tratamientos_veterinaria_petcube_Insert (
    idLog INT IDENTITY (1,1) PRIMARY KEY,
    id_tratamiento INT,
    id_consulta INT,
    nombre_tratamiento VARCHAR(100),
    descripcion VARCHAR(255),
    medicamento VARCHAR(100),
    dosis VARCHAR(50),
    duracion_dias INT,
    observaciones VARCHAR(255),
    Fecharegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_tratamientos_veterinaria_petcube_Update (
    idLog INT IDENTITY (1,1) PRIMARY KEY,
    id_tratamiento INT,
    id_consulta INT,
    nombre_tratamiento VARCHAR(100),
    descripcion VARCHAR(255),
    medicamento VARCHAR(100),
    dosis VARCHAR(50),
    duracion_dias INT,
    observaciones VARCHAR(255),
    Fecharegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Auditoria_tratamientos_veterinaria_petcube_Delete (
    idLog INT IDENTITY (1,1) PRIMARY KEY,
    id_tratamiento INT,
    id_consulta INT,
    nombre_tratamiento VARCHAR(100),
    descripcion VARCHAR(255),
    medicamento VARCHAR(100),
    dosis VARCHAR(50),
    duracion_dias INT,
    observaciones VARCHAR(255),
    Fecharegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE errores_veterinaria_petcube(
    id_error INT IDENTITY(1,1) PRIMARY KEY,
    numero_error INT,
    severidad_error INT,
    estado_error INT,
    procedimiento_error VARCHAR(200),
    linea_error INT,
    mensaje_error VARCHAR(4000),
    fecha_error DATETIME DEFAULT GETDATE()
);

-----------------------------------------------------llave maestra y secuence---------------------------------------------------------

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'PetCube2026$ClaveSegura'

CREATE CERTIFICATE CertificadoSeguridadDatos
WITH SUBJECT = 'Certificado de seguridad PetCube'

CREATE SYMMETRIC KEY ClaveSimetricaDatos
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE CertificadoSeguridadDatos

CREATE SEQUENCE Seq_Folio_Facturas_PetCube
AS INT
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 999999
CYCLE

CREATE SEQUENCE Seq_Consulta_PetCube
AS INT
START WITH 100
INCREMENT BY 1

CREATE SEQUENCE Seq_Tratamiento_PetCube
AS INT
START WITH 100
INCREMENT BY 1

---------------------------------------------------------DATOS------------------------------------------------------------------------

INSERT INTO clientes_veterinaria_petcube VALUES
(1,'Ana','Lopez','Perez','5511111111','ana@mail.com','CDMX','2026-01-01',NULL),
(2,'Luis','Perez','Gomez','5522222222','luis@mail.com','CDMX','2026-01-02',NULL),
(3,'Marta','Ruiz','Diaz','5533333333','marta@mail.com','CDMX','2026-01-03',NULL),
(4,'Carlos','Santos','Lopez','5544444444','carlos@mail.com','CDMX','2026-01-04',NULL),
(5,'Elena','Torres','Gil','5555555555','elena@mail.com','CDMX','2026-01-05',NULL),
(6,'Daniel','Jimenez','Rios','5566666666','daniel@mail.com','CDMX','2026-01-06',NULL),
(7,'Sofia','Martinez','Cruz','5577777777','sofia@mail.com','CDMX','2026-01-07',NULL),
(8,'Victor','Hernandez','Mora','5588888888','victor@mail.com','CDMX','2026-01-08',NULL);

INSERT INTO especies_veterinaria_petcube VALUES
(1,'Perro','Canino'),
(2,'Gato','Felino'),
(3,'Ave','Aves'),
(4,'Conejo','Lagomorfo'),
(5,'Hamster','Roedor'),
(6,'Tortuga','Reptil'),
(7,'Pez','Acuatico'),
(8,'Huron','Mamifero');

INSERT INTO razas_veterinaria_petcube VALUES
(1,1,'Labrador','Grande'),
(2,1,'Bulldog','Mediano'),
(3,2,'Siames','Corto'),
(4,2,'Persa','Largo'),
(5,3,'Canario','Ave'),
(6,4,'Holandes','Conejo'),
(7,5,'Sirio','Hamster'),
(8,6,'Japonesa','Tortuga');

OPEN SYMMETRIC KEY ClaveSimetricaDatos
DECRYPTION BY CERTIFICATE CertificadoSeguridadDatos

INSERT INTO veterinarios_veterinaria_petcube VALUES
(1,'Luis','Gomez','Perez','General',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CED123'),'5511110001','vet1@mail.com','9-5',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'VetPass1@2026')),
(2,'Ana','Lopez','Diaz','Cirugia',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CED124'),'5511110002','vet2@mail.com','9-5',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'VetPass2@2026')),
(3,'Carlos','Ruiz','Mora','Dermatologia',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CED125'),'5511110003','vet3@mail.com','9-5',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'VetPass3@2026')),
(4,'Elena','Torres','Gil','General',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CED126'),'5511110004','vet4@mail.com','9-5',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'VetPass4@2026')),
(5,'Jorge','Ramirez','Cruz','Cardio',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CED127'),'5511110005','vet5@mail.com','9-5',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'VetPass5@2026')),
(6,'Marta','Santos','Rios','General',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CED128'),'5511110006','vet6@mail.com','9-5',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'VetPass6@2026')),
(7,'Pedro','Navarro','Salas','Cirugia',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CED129'),'5511110007','vet7@mail.com','9-5',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'VetPass7@2026')),
(8,'Sofia','Martinez','Lopez','General',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CED130'),'5511110008','vet8@mail.com','9-5',EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'VetPass8@2026'));

CLOSE SYMMETRIC KEY ClaveSimetricaDatos

INSERT INTO mascotas_veterinaria_petcube VALUES
(1,1,1,1,'Max','M','2020-01-01',25.50),
(2,2,2,3,'Michi','F','2021-02-02',5.20),
(3,3,1,2,'Rocky','M','2019-03-03',30.00),
(4,4,2,4,'Luna','F','2022-04-04',4.50),
(5,5,3,5,'Piolin','M','2023-05-05',0.50),
(6,6,4,6,'Bunny','F','2022-06-06',2.30),
(7,7,5,7,'Hammy','M','2023-07-07',0.30),
(8,8,6,8,'Torty','F','2020-08-08',1.20);

INSERT INTO expedientes_veterinaria_petcube VALUES
(1,1,'2026-01-15','Sin antecedentes graves','Ninguno','Paciente estable'),
(2,2,'2026-01-16','Alergia leve','Dermatitis','Seguimiento dermatologico'),
(3,3,'2026-01-17','Vacunacion incompleta','Ninguno','Aplicar refuerzo'),
(4,4,'2026-01-18','Problemas digestivos previos','Gastritis','Dieta especial'),
(5,5,'2026-01-19','Sin antecedentes','Ninguno','Mascota sana'),
(6,6,'2026-01-20','Sin antecedentes','Ninguno','Ave en buen estado'),
(7,7,'2026-01-21','Sin antecedentes','Ninguno','Revision preventiva'),
(8,8,'2026-01-22','Caparazon sensible','Ninguno','Aplicar calcio');

INSERT INTO servicios_veterinaria_petcube VALUES
(1,'Consulta','General',300.00,'Activo'),
(2,'Cirugia','Mayor',5000.00,'Activo'),
(3,'Vacunacion','Basica',200.00,'Activo'),
(4,'Desparasitacion','Interna',150.00,'Activo'),
(5,'Baño','Completo',250.00,'Activo'),
(6,'Rayos X','Diagnostico',800.00,'Activo'),
(7,'Ultrasonido','Diagnostico',900.00,'Activo'),
(8,'Emergencia','Urgente',1000.00,'Activo');

INSERT INTO vacunas_veterinaria_petcube VALUES
(1,'Rabia','Antirrabica','1 dosis','Anual',150.00),
(2,'Parvo','Parvovirus','1 dosis','Anual',200.00),
(3,'Moquillo','Distemper','1 dosis','Anual',200.00),
(4,'Triple','Triple felina','1 dosis','Anual',250.00),
(5,'Leptospira','Bacteriana','1 dosis','Anual',180.00),
(6,'Influenza','Canina','1 dosis','Anual',220.00),
(7,'Hepatitis','Canina','1 dosis','Anual',210.00),
(8,'Bordetella','Respiratoria','1 dosis','Anual',190.00);

INSERT INTO productos_veterinaria_petcube VALUES
(1,'Croquetas','Alimento','Perro',50,800.00,'2026-12-01','Activo'),
(2,'Arena','Higiene','Gato',40,300.00,'2027-01-01','Activo'),
(3,'Juguete','Accesorio','General',30,150.00,'2028-01-01','Activo'),
(4,'Shampoo','Higiene','Perro',25,120.00,'2026-05-01','Activo'),
(5,'Collar','Accesorio','Perro',20,200.00,'2028-01-01','Activo'),
(6,'Transportadora','Accesorio','General',10,900.00,'2028-01-01','Activo'),
(7,'Vitaminas','Salud','General',15,250.00,'2027-02-01','Activo'),
(8,'Peine','Accesorio','General',35,80.00,'2028-01-01','Activo');

INSERT INTO citas_veterinaria_petcube VALUES
(1,1,1,'2026-02-01','10:00','Chequeo','Completada',''),
(2,2,2,'2026-02-02','11:00','Vacuna','Pendiente',''),
(3,3,3,'2026-02-03','12:00','Dolor','Completada',''),
(4,4,4,'2026-02-04','13:00','Revision','Pendiente',''),
(5,5,5,'2026-02-05','14:00','Consulta','Completada',''),
(6,6,6,'2026-02-06','15:00','Cirugia','Pendiente',''),
(7,7,7,'2026-02-07','16:00','Chequeo','Completada',''),
(8,8,8,'2026-02-08','17:00','Vacuna','Pendiente','');

INSERT INTO consultas_veterinaria_petcube VALUES
(1,'2026-02-01 10:30:00','Chequeo general','Pendiente',1,1),
(2,'2026-02-02 11:30:00','Aplicacion de vacuna','Pendiente',2,2),
(3,'2026-02-03 12:30:00','Dolor abdominal','Pendiente',3,3),
(4,'2026-02-04 13:30:00','Revision general','Pendiente',4,4),
(5,'2026-02-05 14:30:00','Consulta preventiva','Pendiente',5,5),
(6,'2026-02-06 15:30:00','Valoracion quirurgica','Pendiente',6,6),
(7,'2026-02-07 16:30:00','Chequeo general','Pendiente',7,7),
(8,'2026-02-08 17:30:00','Aplicacion de vacuna','Pendiente',8,8);

INSERT INTO mascotas_vacunas_veterinaria_petcube VALUES
(1,'2026-02-02','2027-02-02','Aplicacion normal',1,1,1),
(2,'2026-02-03','2027-02-03','Sin reacciones',2,4,2),
(3,'2026-02-04','2027-02-04','Aplicacion correcta',3,2,3),
(4,'2026-02-05','2027-02-05','Paciente estable',4,5,4),
(5,'2026-02-06','2027-02-06','Aplicacion sin novedad',5,6,5),
(6,'2026-02-07','2027-02-07','Buen comportamiento',6,7,6),
(7,'2026-02-08','2027-02-08','Aplicacion preventiva',7,8,7),
(8,'2026-02-09','2027-02-09','Requiere seguimiento',8,3,8);

INSERT INTO ventas_veterinaria_petcube VALUES
(1,1,'2026-02-01',100.00,16.00,116.00,'Efectivo','Pagado'),
(2,2,'2026-02-02',200.00,32.00,232.00,'Tarjeta','Pagado'),
(3,3,'2026-02-03',300.00,48.00,348.00,'Efectivo','Pagado'),
(4,4,'2026-02-04',400.00,64.00,464.00,'Transferencia','Pagado'),
(5,5,'2026-02-05',500.00,80.00,580.00,'Tarjeta','Pagado'),
(6,6,'2026-02-06',600.00,96.00,696.00,'Efectivo','Pagado'),
(7,7,'2026-02-07',700.00,112.00,812.00,'Tarjeta','Pagado'),
(8,8,'2026-02-08',800.00,128.00,928.00,'Transferencia','Pagado');

INSERT INTO detalle_ventas_veterinaria_petcube VALUES
(1,800.00,800.00,1,1),
(2,300.00,300.00,2,2),
(3,150.00,150.00,3,3),
(4,120.00,120.00,4,4),
(5,200.00,200.00,5,5),
(6,900.00,900.00,6,6),
(7,250.00,250.00,7,7),
(8,80.00,80.00,8,8);

INSERT INTO facturas_veterinaria_petcube VALUES
(1,'FAC-001','2026-02-01','XAXX010101000','Ana Lopez Perez',100.00,16.00,116.00,1,NULL),
(2,'FAC-002','2026-02-02','XAXX010101000','Luis Perez Gomez',200.00,32.00,232.00,2,NULL),
(3,'FAC-003','2026-02-03','XAXX010101000','Marta Ruiz Diaz',300.00,48.00,348.00,3,NULL),
(4,'FAC-004','2026-02-04','XAXX010101000','Carlos Santos Lopez',400.00,64.00,464.00,4,NULL),
(5,'FAC-005','2026-02-05','XAXX010101000','Elena Torres Gil',500.00,80.00,580.00,5,NULL),
(6,'FAC-006','2026-02-06','XAXX010101000','Daniel Jimenez Rios',600.00,96.00,696.00,6,NULL),
(7,'FAC-007','2026-02-07','XAXX010101000','Sofia Martinez Cruz',700.00,112.00,812.00,7,NULL),
(8,'FAC-008','2026-02-08','XAXX010101000','Victor Hernandez Mora',800.00,128.00,928.00,8,NULL);

INSERT INTO tratamientos_veterinaria_petcube VALUES
(1,1,'Antibiotico oral','Tratamiento infeccion leve','Amoxicilina','5 ml cada 12 hrs',7,'Completar tratamiento',NULL,NULL),
(2,2,'Antiinflamatorio','Control de inflamacion','Meloxicam','2 ml cada 24 hrs',5,'Dar despues de alimento',NULL,NULL),
(3,3,'Vitaminas','Refuerzo general','Complejo B','1 tableta diaria',10,'Monitorear apetito',NULL,NULL),
(4,4,'Desparasitacion','Eliminacion de parasitos','Albendazol','1 dosis unica',1,'Repetir en 6 meses',NULL,NULL),
(5,5,'Curacion topica','Tratamiento de herida','Pomada antibiotica','Aplicar 2 veces al dia',8,'Mantener limpia la zona',NULL,NULL),
(6,6,'Dieta blanda','Control digestivo','Alimento gastrointestinal','2 porciones diarias',6,'Evitar premios',NULL,NULL),
(7,7,'Gotas oftalmicas','Tratamiento ocular','Tobramicina','2 gotas cada 8 hrs',7,'No tocar el ojo con el gotero',NULL,NULL),
(8,8,'Suplemento calcio','Fortalecimiento oseo','Calcio veterinario','3 ml diarios',15,'Agitar antes de usar',NULL,NULL);

OPEN SYMMETRIC KEY ClaveSimetricaDatos
DECRYPTION BY CERTIFICATE CertificadoSeguridadDatos

INSERT INTO clientes_seguridad_veterinaria_petcube VALUES
(1, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'5511111111'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'ana@mail.com'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CDMX')),
(2, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'5522222222'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'luis@mail.com'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CDMX')),
(3, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'5533333333'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'marta@mail.com'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CDMX')),
(4, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'5544444444'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'carlos@mail.com'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CDMX')),
(5, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'5555555555'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'elena@mail.com'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CDMX')),
(6, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'5566666666'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'daniel@mail.com'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CDMX')),
(7, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'5577777777'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'sofia@mail.com'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CDMX')),
(8, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'5588888888'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'victor@mail.com'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'CDMX'));

INSERT INTO tratamientos_seguridad_veterinaria_petcube VALUES
(1, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Amoxicilina'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'5 ml cada 12 hrs'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Completar tratamiento')),
(2, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Meloxicam'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'2 ml cada 24 hrs'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Dar despues de alimento')),
(3, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Complejo B'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'1 tableta diaria'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Monitorear apetito')),
(4, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Albendazol'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'1 dosis unica'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Repetir en 6 meses')),
(5, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Pomada antibiotica'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Aplicar 2 veces al dia'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Mantener limpia la zona')),
(6, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Alimento gastrointestinal'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'2 porciones diarias'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Evitar premios')),
(7, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Tobramicina'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'2 gotas cada 8 hrs'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'No tocar el ojo con el gotero')),
(8, EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Calcio veterinario'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'3 ml diarios'), EncryptByKey(Key_GUID('ClaveSimetricaDatos'),'Agitar antes de usar'));

UPDATE clientes_veterinaria_petcube
SET numero_documento = EncryptByKey(Key_GUID('ClaveSimetricaDatos'), CONCAT('DOC-', id_cliente, '-2026'));

UPDATE tratamientos_veterinaria_petcube
SET diagnostico = EncryptByKey(Key_GUID('ClaveSimetricaDatos'), CONCAT('Diagnostico del tratamiento ', id_tratamiento));

UPDATE tratamientos_veterinaria_petcube
SET tratamiento = EncryptByKey(Key_GUID('ClaveSimetricaDatos'), CONCAT('Indicacion clinica del tratamiento ', id_tratamiento));

UPDATE facturas_veterinaria_petcube
SET referencia_pago = EncryptByKey(Key_GUID('ClaveSimetricaDatos'), CONCAT('REF-PAGO-', id_factura, '-2026'));

CLOSE SYMMETRIC KEY ClaveSimetricaDatos

----------------------------------------------------triggers---------------------------------------------------------------------------

CREATE TRIGGER tr_consultas_insert
ON consultas_veterinaria_petcube
AFTER INSERT
AS
BEGIN
    INSERT INTO Auditoria_consultas_veterinaria_petcube
    (id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,FechaRegistro)
    SELECT id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,GETDATE()
    FROM inserted;

    INSERT INTO Auditoria_consultas_veterinaria_petcube_Insert
    (id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,FechaRegistro)
    SELECT id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,GETDATE()
    FROM inserted;
END

CREATE TRIGGER tr_consultas_update
ON consultas_veterinaria_petcube
AFTER UPDATE
AS
BEGIN
    INSERT INTO Auditoria_consultas_veterinaria_petcube
    (id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,FechaRegistro)
    SELECT id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,GETDATE()
    FROM inserted;

    INSERT INTO Auditoria_consultas_veterinaria_petcube_Update
    (id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,FechaRegistro)
    SELECT id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,GETDATE()
    FROM inserted;
END

CREATE TRIGGER tr_consultas_delete
ON consultas_veterinaria_petcube
AFTER DELETE
AS
BEGIN
    INSERT INTO Auditoria_consultas_veterinaria_petcube
    (id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,FechaRegistro)
    SELECT id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,GETDATE()
    FROM deleted;

    INSERT INTO Auditoria_consultas_veterinaria_petcube_Delete
    (id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,FechaRegistro)
    SELECT id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario,GETDATE()
    FROM deleted;
END

CREATE TRIGGER tr_tratamientos_insert
ON tratamientos_veterinaria_petcube
AFTER INSERT
AS
BEGIN
    INSERT INTO Auditoria_tratamientos_veterinaria_petcube
    (id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,Fecharegistro)
    SELECT id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,GETDATE()
    FROM inserted;

    INSERT INTO Auditoria_tratamientos_veterinaria_petcube_Insert
    (id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,Fecharegistro)
    SELECT id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,GETDATE()
    FROM inserted;

    UPDATE c
    SET estado = 'En tratamiento'
    FROM consultas_veterinaria_petcube c
    INNER JOIN inserted i ON c.id_consulta = i.id_consulta;
END

CREATE TRIGGER tr_tratamientos_update
ON tratamientos_veterinaria_petcube
AFTER UPDATE
AS
BEGIN
    INSERT INTO Auditoria_tratamientos_veterinaria_petcube
    (id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,Fecharegistro)
    SELECT id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,GETDATE()
    FROM inserted;

    INSERT INTO Auditoria_tratamientos_veterinaria_petcube_Update
    (id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,Fecharegistro)
    SELECT id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,GETDATE()
    FROM inserted;
END

CREATE TRIGGER tr_tratamientos_delete
ON tratamientos_veterinaria_petcube
AFTER DELETE
AS
BEGIN
    INSERT INTO Auditoria_tratamientos_veterinaria_petcube
    (id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,Fecharegistro)
    SELECT id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,GETDATE()
    FROM deleted;

    INSERT INTO Auditoria_tratamientos_veterinaria_petcube_Delete
    (id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,Fecharegistro)
    SELECT id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones,GETDATE()
    FROM deleted;
END

CREATE TRIGGER tr_facturas_insert
ON facturas_veterinaria_petcube
AFTER INSERT
AS
BEGIN
    INSERT INTO Auditoria_facturas_veterinaria_petcube
    (id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,FechaRegistro)
    SELECT id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,GETDATE()
    FROM inserted;

    INSERT INTO Auditoria_facturas_veterinaria_petcube_Insert
    (id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,FechaRegistro)
    SELECT id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,GETDATE()
    FROM inserted;

    UPDATE c
    SET estado = 'Facturada'
    FROM consultas_veterinaria_petcube c
    INNER JOIN mascotas_veterinaria_petcube m ON c.id_mascota = m.id_mascota
    INNER JOIN ventas_veterinaria_petcube v ON m.id_cliente = v.id_cliente
    INNER JOIN inserted i ON v.id_venta = i.id_venta
    WHERE c.id_consulta = (
        SELECT MAX(c2.id_consulta)
        FROM consultas_veterinaria_petcube c2
        INNER JOIN mascotas_veterinaria_petcube m2 ON c2.id_mascota = m2.id_mascota
        WHERE m2.id_cliente = v.id_cliente
    );
END

CREATE TRIGGER tr_facturas_update
ON facturas_veterinaria_petcube
AFTER UPDATE
AS
BEGIN
    INSERT INTO Auditoria_facturas_veterinaria_petcube
    (id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,FechaRegistro)
    SELECT id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,GETDATE()
    FROM inserted;

    INSERT INTO Auditoria_facturas_veterinaria_petcube_Update
    (id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,FechaRegistro)
    SELECT id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,GETDATE()
    FROM inserted;
END

CREATE TRIGGER tr_facturas_delete
ON facturas_veterinaria_petcube
AFTER DELETE
AS
BEGIN
    INSERT INTO Auditoria_facturas_veterinaria_petcube
    (id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,FechaRegistro)
    SELECT id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,GETDATE()
    FROM deleted;

    INSERT INTO Auditoria_facturas_veterinaria_petcube_Delete
    (id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,FechaRegistro)
    SELECT id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta,GETDATE()
    FROM deleted;
END

CREATE PROCEDURE sp_RegistrarDuenoCifrado
    @id_cliente INT,
    @nombre VARCHAR(50),
    @apellido_paterno VARCHAR(50),
    @apellido_materno VARCHAR(50),
    @telefono VARCHAR(15),
    @correo VARCHAR(100),
    @direccion VARCHAR(150),
    @fecha_registro DATE
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO clientes_veterinaria_petcube
        (id_cliente,nombre,apellido_paterno,apellido_materno,telefono,correo,direccion,fecha_registro)
        VALUES
        (@id_cliente,@nombre,@apellido_paterno,@apellido_materno,@telefono,@correo,@direccion,@fecha_registro);

        OPEN SYMMETRIC KEY ClaveSimetricaDatos
        DECRYPTION BY CERTIFICATE CertificadoSeguridadDatos;

        INSERT INTO clientes_seguridad_veterinaria_petcube
        (id_cliente,telefono_cifrado,correo_cifrado,direccion_cifrada)
        VALUES
        (
            @id_cliente,
            EncryptByKey(Key_GUID('ClaveSimetricaDatos'),@telefono),
            EncryptByKey(Key_GUID('ClaveSimetricaDatos'),@correo),
            EncryptByKey(Key_GUID('ClaveSimetricaDatos'),@direccion)
        );

        CLOSE SYMMETRIC KEY ClaveSimetricaDatos;

        COMMIT TRANSACTION;
        PRINT 'Dueño registrado con datos cifrados.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error al registrar dueño cifrado.';
        PRINT ERROR_MESSAGE();
    END CATCH
END

CREATE PROCEDURE sp_RegistrarConsulta
    @id_consulta INT,
    @fecha_consulta DATETIME,
    @motivo VARCHAR(150),
    @id_mascota INT,
    @id_veterinario INT
AS
BEGIN
    INSERT INTO consultas_veterinaria_petcube
    (id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario)
    VALUES
    (@id_consulta,@fecha_consulta,@motivo,'Pendiente',@id_mascota,@id_veterinario);
END

CREATE PROCEDURE sp_GenerarTratamientoCifrado
    @id_tratamiento INT,
    @id_consulta INT,
    @nombre_tratamiento VARCHAR(100),
    @descripcion VARCHAR(255),
    @medicamento VARCHAR(100),
    @dosis VARCHAR(50),
    @duracion_dias INT,
    @observaciones VARCHAR(255)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO tratamientos_veterinaria_petcube
        (id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones)
        VALUES
        (@id_tratamiento,@id_consulta,@nombre_tratamiento,@descripcion,@medicamento,@dosis,@duracion_dias,@observaciones);

        OPEN SYMMETRIC KEY ClaveSimetricaDatos
        DECRYPTION BY CERTIFICATE CertificadoSeguridadDatos;

        INSERT INTO tratamientos_seguridad_veterinaria_petcube
        (id_tratamiento,medicamento_cifrado,dosis_cifrada,observaciones_cifradas)
        VALUES
        (
            @id_tratamiento,
            EncryptByKey(Key_GUID('ClaveSimetricaDatos'),@medicamento),
            EncryptByKey(Key_GUID('ClaveSimetricaDatos'),@dosis),
            EncryptByKey(Key_GUID('ClaveSimetricaDatos'),@observaciones)
        );

        CLOSE SYMMETRIC KEY ClaveSimetricaDatos;

        COMMIT TRANSACTION;
        PRINT 'Tratamiento cifrado generado correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Error al generar tratamiento cifrado.';
        PRINT ERROR_MESSAGE();
    END CATCH
END

CREATE PROCEDURE sp_ReportesConsultasPorVeterinario
    @id_veterinario INT
AS
BEGIN
    SELECT
        v.id_veterinario,
        v.nombre,
        v.apellido_paterno,
        c.id_consulta,
        c.fecha_consulta,
        c.motivo,
        c.estado,
        m.id_mascota,
        m.nombre AS nombre_mascota
    FROM consultas_veterinaria_petcube c
    INNER JOIN veterinarios_veterinaria_petcube v
        ON c.id_veterinario = v.id_veterinario
    INNER JOIN mascotas_veterinaria_petcube m
        ON c.id_mascota = m.id_mascota
    WHERE v.id_veterinario = @id_veterinario
    ORDER BY c.fecha_consulta;
END

CREATE PROCEDURE sp_ProcesoCompletoConsultaTratamientoFactura
    @id_consulta INT,
    @fecha_consulta DATETIME,
    @motivo VARCHAR(150),
    @id_mascota INT,
    @id_veterinario INT,
    @id_tratamiento INT,
    @nombre_tratamiento VARCHAR(100),
    @descripcion VARCHAR(255),
    @medicamento VARCHAR(100),
    @dosis VARCHAR(50),
    @duracion_dias INT,
    @observaciones VARCHAR(255),
    @id_venta INT,
    @id_cliente INT,
    @fecha_venta DATE,
    @subtotal DECIMAL(10,2),
    @iva DECIMAL(10,2),
    @total DECIMAL(8,2),
    @metodo_pago VARCHAR(250),
    @estado_venta VARCHAR(250),
    @id_factura INT,
    @folio VARCHAR(100),
    @fecha_factura DATE,
    @rfc_cliente VARCHAR(20),
    @razon_social VARCHAR(100)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO consultas_veterinaria_petcube
        (id_consulta,fecha_consulta,motivo,estado,id_mascota,id_veterinario)
        VALUES
        (@id_consulta,@fecha_consulta,@motivo,'Pendiente',@id_mascota,@id_veterinario);

        INSERT INTO tratamientos_veterinaria_petcube
        (id_tratamiento,id_consulta,nombre_tratamiento,descripcion,medicamento,dosis,duracion_dias,observaciones)
        VALUES
        (@id_tratamiento,@id_consulta,@nombre_tratamiento,@descripcion,@medicamento,@dosis,@duracion_dias,@observaciones);

        INSERT INTO ventas_veterinaria_petcube
        (id_venta,id_cliente,fecha_venta,subtotal,iva,total,metodo_pago,estado_venta)
        VALUES
        (@id_venta,@id_cliente,@fecha_venta,@subtotal,@iva,@total,@metodo_pago,@estado_venta);

        INSERT INTO facturas_veterinaria_petcube
        (id_factura,folio,fecha_factura,rfc_cliente,razon_social,subtotal,iva,total,id_venta)
        VALUES
        (@id_factura,@folio,@fecha_factura,@rfc_cliente,@razon_social,@subtotal,@iva,@total,@id_venta);

        COMMIT TRANSACTION;
        PRINT 'Proceso completo realizado correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Ocurrió un error y se aplicó ROLLBACK.';
        PRINT ERROR_MESSAGE();
    END CATCH
END

CREATE PROCEDURE sp_GenerarFacturaConFolio
    @id_factura INT,
    @fecha_factura DATE,
    @rfc_cliente VARCHAR(20),
    @razon_social VARCHAR(100),
    @subtotal DECIMAL(10,2),
    @iva DECIMAL(10,2),
    @total DECIMAL(10,2),
    @id_venta INT,
    @referencia_pago VARCHAR(100)
AS
BEGIN
    DECLARE @folio_generado VARCHAR(100);

    SET @folio_generado = CONCAT('PET-FAC-', NEXT VALUE FOR Seq_Folio_Facturas_PetCube);

    OPEN SYMMETRIC KEY ClaveSimetricaDatos
    DECRYPTION BY CERTIFICATE CertificadoSeguridadDatos;

    INSERT INTO facturas_veterinaria_petcube
    (id_factura, folio, fecha_factura, rfc_cliente, razon_social, subtotal, iva, total, id_venta, referencia_pago)
    VALUES
    (
        @id_factura,
        @folio_generado,
        @fecha_factura,
        @rfc_cliente,
        @razon_social,
        @subtotal,
        @iva,
        @total,
        @id_venta,
        EncryptByKey(Key_GUID('ClaveSimetricaDatos'), @referencia_pago)
    );

    CLOSE SYMMETRIC KEY ClaveSimetricaDatos;

    SELECT @folio_generado AS FolioGenerado;
END

CREATE PROCEDURE sp_ClasificacionClientesFrecuentes
AS
BEGIN
    SELECT
        c.id_cliente,
        c.nombre,
        c.apellido_paterno,
        COUNT(v.id_venta) AS total_ventas,
        CASE
            WHEN COUNT(v.id_venta) >= 5 THEN 'Cliente Muy Frecuente'
            WHEN COUNT(v.id_venta) BETWEEN 3 AND 4 THEN 'Cliente Frecuente'
            WHEN COUNT(v.id_venta) BETWEEN 1 AND 2 THEN 'Cliente Ocasional'
            ELSE 'Cliente Sin Compras'
        END AS clasificacion_cliente
    FROM clientes_veterinaria_petcube c
    LEFT JOIN ventas_veterinaria_petcube v
        ON c.id_cliente = v.id_cliente
    GROUP BY c.id_cliente, c.nombre, c.apellido_paterno
    ORDER BY total_ventas DESC;
END

CREATE PROCEDURE sp_RankingVeterinariosConsultas
AS
BEGIN
    SELECT
        v.id_veterinario,
        v.nombre,
        v.apellido_paterno,
        COUNT(c.id_consulta) AS total_consultas,
        RANK() OVER (ORDER BY COUNT(c.id_consulta) DESC) AS ranking_consultas
    FROM veterinarios_veterinaria_petcube v
    LEFT JOIN consultas_veterinaria_petcube c
        ON v.id_veterinario = c.id_veterinario
    GROUP BY v.id_veterinario, v.nombre, v.apellido_paterno
    ORDER BY ranking_consultas;
END

CREATE PROCEDURE sp_InsertarConsultaConManejoErrores
    @id_consulta INT,
    @fecha_consulta DATETIME,
    @motivo VARCHAR(150),
    @estado VARCHAR(20),
    @id_mascota INT,
    @id_veterinario INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO consultas_veterinaria_petcube
        (id_consulta, fecha_consulta, motivo, estado, id_mascota, id_veterinario)
        VALUES
        (@id_consulta, @fecha_consulta, @motivo, @estado, @id_mascota, @id_veterinario);

        COMMIT TRANSACTION;
        PRINT 'Consulta insertada correctamente.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        INSERT INTO errores_veterinaria_petcube
        (numero_error, severidad_error, estado_error, procedimiento_error, linea_error, mensaje_error)
        VALUES
        (
            ERROR_NUMBER(),
            ERROR_SEVERITY(),
            ERROR_STATE(),
            ERROR_PROCEDURE(),
            ERROR_LINE(),
            ERROR_MESSAGE()
        );

        PRINT 'Se produjo un error. Se aplicó rollback.';
    END CATCH
END

CREATE TABLE Pivot_Consultas_Por_Mes_PetCube(
    nombre_veterinario VARCHAR(50),
    Enero INT,
    Febrero INT,
    Marzo INT,
    Abril INT,
    Mayo INT,
    Junio INT,
    Julio INT,
    Agosto INT,
    Septiembre INT,
    Octubre INT,
    Noviembre INT,
    Diciembre INT
);

INSERT INTO Pivot_Consultas_Por_Mes_PetCube
SELECT 
    nombre_veterinario,
    ISNULL([January],0),
    ISNULL([February],0),
    ISNULL([March],0),
    ISNULL([April],0),
    ISNULL([May],0),
    ISNULL([June],0),
    ISNULL([July],0),
    ISNULL([August],0),
    ISNULL([September],0),
    ISNULL([October],0),
    ISNULL([November],0),
    ISNULL([December],0)
FROM
(
    SELECT
        v.nombre AS nombre_veterinario,
        DATENAME(MONTH, c.fecha_consulta) AS mes_consulta,
        c.id_consulta
    FROM consultas_veterinaria_petcube c
    INNER JOIN veterinarios_veterinaria_petcube v
        ON c.id_veterinario = v.id_veterinario
) AS origen
PIVOT
(
    COUNT(id_consulta)
    FOR mes_consulta IN
    ([January],[February],[March],[April],[May],[June],[July],[August],[September],[October],[November],[December])
) AS tabla_pivot;

SELECT *
INTO clientes_frecuentes_veterinaria_petcube
FROM clientes_veterinaria_petcube
WHERE id_cliente IN (
    SELECT id_cliente
    FROM ventas_veterinaria_petcube
    GROUP BY id_cliente
    HAVING COUNT(*) >= 1
);

SELECT *
INTO clientes_no_frecuentes_veterinaria_petcube
FROM clientes_veterinaria_petcube
WHERE id_cliente NOT IN (
    SELECT id_cliente
    FROM ventas_veterinaria_petcube
);

CREATE TABLE clientes_generales_veterinaria_petcube(
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50),
    fecha_registro DATE
);

CREATE TABLE clientes_sensibles_veterinaria_petcube(
    id_cliente INT PRIMARY KEY,
    telefono VARCHAR(15),
    correo VARCHAR(100),
    direccion VARCHAR(150),
    numero_documento VARBINARY(MAX)
);

INSERT INTO clientes_generales_veterinaria_petcube
SELECT id_cliente, nombre, apellido_paterno, apellido_materno, fecha_registro
FROM clientes_veterinaria_petcube;

INSERT INTO clientes_sensibles_veterinaria_petcube
SELECT id_cliente, telefono, correo, direccion, numero_documento
FROM clientes_veterinaria_petcube;

CREATE VIEW vw_SistemaCompleto_PetCube
AS
SELECT
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.apellido_paterno,
    m.id_mascota,
    m.nombre AS nombre_mascota,
    e.nombre_especie,
    r.nombre_raza,
    ci.id_cita,
    ci.fecha_cita,
    co.id_consulta,
    co.fecha_consulta,
    co.motivo,
    co.estado,
    t.id_tratamiento,
    t.nombre_tratamiento,
    v.id_veterinario,
    v.nombre AS nombre_veterinario,
    ve.id_venta,
    f.id_factura,
    f.folio,
    p.nombre_producto
FROM clientes_veterinaria_petcube c
LEFT JOIN mascotas_veterinaria_petcube m
    ON c.id_cliente = m.id_cliente
LEFT JOIN especies_veterinaria_petcube e
    ON m.id_especie = e.id_especie
LEFT JOIN razas_veterinaria_petcube r
    ON m.id_raza = r.id_raza
LEFT JOIN citas_veterinaria_petcube ci
    ON m.id_mascota = ci.id_mascota
LEFT JOIN consultas_veterinaria_petcube co
    ON m.id_mascota = co.id_mascota
LEFT JOIN tratamientos_veterinaria_petcube t
    ON co.id_consulta = t.id_consulta
LEFT JOIN veterinarios_veterinaria_petcube v
    ON co.id_veterinario = v.id_veterinario
LEFT JOIN ventas_veterinaria_petcube ve
    ON c.id_cliente = ve.id_cliente
LEFT JOIN facturas_veterinaria_petcube f
    ON ve.id_venta = f.id_venta
LEFT JOIN detalle_ventas_veterinaria_petcube dv
    ON ve.id_venta = dv.id_venta
LEFT JOIN productos_veterinaria_petcube p
    ON dv.id_producto = p.id_producto;

CREATE NONCLUSTERED INDEX Indice_clientes_correo
ON clientes_veterinaria_petcube(correo);

CREATE NONCLUSTERED INDEX Indice_consultas_fecha_consulta
ON consultas_veterinaria_petcube(fecha_consulta);

CREATE NONCLUSTERED INDEX Indice_consultas_estado
ON consultas_veterinaria_petcube(estado);

CREATE NONCLUSTERED INDEX Indice_citas_fecha_cita
ON citas_veterinaria_petcube(fecha_cita);

CREATE NONCLUSTERED INDEX Indice_citas_estado_cita
ON citas_veterinaria_petcube(estado_cita);

CREATE NONCLUSTERED INDEX Indice_facturas_fecha_factura
ON facturas_veterinaria_petcube(fecha_factura);