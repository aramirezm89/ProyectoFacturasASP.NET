CREATE DATABASE PROYECTO_FACTURA

CREATE  TABLE TBL_Clientes(

id_cliente int PRIMARY KEY not null,
nombre VARCHAR(50)not null,
rut_cliente VARCHAR(12) not null,
giro VARCHAR (50)not null,
direccion VARCHAR(50)not null,
comuna VARCHAR(50) not null,
ciudad VARCHAR (50)not null ,
telefono int not null,
email varchar(100) not null,

)




CREATE TABLE TBL_EncabezadoFactura(

numero_factura int PRIMARY KEY not null,
tipo_factura VARCHAR(50)not null,
rut_empresa VARCHAR(12) not null,
razon_social VARCHAR(50) not null,
id_cliente int not null,
fecha DATE not null,
condicion_pago varchar(50) not null,
estado varchar(20) not null
CONSTRAINT fk_TBL_Empresas FOREIGN KEY (rut_empresa) REFERENCES TBL_Empresas (rut_empresa),
CONSTRAINT fk_TBL_Cliente  FOREIGN KEY (id_cliente) REFERENCES TBL_Clientes (id_cliente)

)




CREATE TABLE TBL_Empresas(

rut_empresa varchar (12) primary key not null,
nombre_empresa varchar (50) not null,

)




CREATE table TBL_Productos (

codigo_producto int primary key not null,
descripcion_producto varchar (50) not null,
UM varchar(5) not null,
precio_unitario NUMERIC (10,2) not null,


)

CREATE TABLE TBL_Detalle (
numero_factura INT not null,
codigo_producto INT not null,
cantidad_producto INT not null,
precio_unitario INT not null,
monto_total NUMERIC (10,2) not null,
monto_neto NUMERIC (10,2) not null,
iva NUMERIC (10,2) not null
CONSTRAINT fk_TBL_EncabezadoFactura foreign key (numero_factura) references TBL_EncabezadoFactura (numero_factura),
CONSTRAINT fk_TBL_Productos foreign key (codigo_producto) references TBL_Productos (codigo_producto)

)


CREATE TABLE TBL_UsuariosRegistrados(

usuario varchar(50),
pass  varchar (20),
nombre varchar(100),
apellido varchar(100)
)

INSERT INTO TBL_UsuariosRegistrados VALUES ('aramirezm','ramirez1989','Antonio','Ramriez')
INSERT INTO TBL_UsuariosRegistrados VALUES ('Sandor','Ibañez','Sandor','Ibañez')

----------------------------------------------------------------------------------------------------
--Procedimiento almacenado para buscar usuarios registrados
-------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_BuscarUsuariosRegistrados
@in_usuario VARCHAR(50),
@in_paass   Varchar(20)
AS
BEGIN
 SELECT * FROM TBL_UsuariosRegistrados where usuario = @in_usuario and pass  =@in_paass
END



------------------------------------------------------------------------------------------------------
--procedimiento almacenado que inserta registros a la tabla TBL_Productos
------------------------------------------------------------------------------------------------------

CREATE PROCEDURE SP_InsertProductos
@in_codigo_producto int,
@in_descripcion_producto VARCHAR(50),
@in_UM VARCHAR(5),
@in_precio_unitario NUMERIC(10,2)
AS
BEGIN
 INSERT INTO TBL_Productos VALUES(@in_codigo_producto,@in_descripcion_producto,@in_UM,@in_precio_unitario)
END


EXEC SP_InsertProductos 876554,'DiscoDuro_WD_SE-1TB','UN',74990

-------------------------------------------------------------------------------------------------------------
--Procedimiento almacenado que inserta registros a la tabla empresa
-------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE SP_InsertEmpresa

@in_rut_empresa VARCHAR(12),
@in_nombre_empresa VARCHAR(50)
AS
BEGIN
 INSERT INTO TBL_Empresas VALUES(@in_rut_empresa,@in_nombre_empresa)
END

EXEC SP_InsertEmpresa '15667899-2','ACL-Ltda'

---------------------------------------------------------------------------------------------------------------
--Procedimiento almacenado que inserta un cliente
---------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE SP_InsertCliente
@in_id_cliente INT,
@in_nombre VARCHAR(50),
@in_rut_cliente VARCHAR(12),
@in_giro VARCHAR(50),
@in_direccion VARCHAR(50),
@in_comuna VARCHAR(50),
@in_ciudad VARCHAR (50),
@in_telefono int,
@in_email varchar(100)
AS
BEGIN
	INSERT INTO TBL_Clientes VAlUES(@in_id_cliente,@in_nombre,@in_rut_cliente,@in_giro,
									@in_direccion,@in_comuna,@in_ciudad,@in_telefono,@in_email)
END


EXEC SP_InsertCliente 4,'Carla Toro M','20990876-2','Comercial','AV El Parque 97',
						'Huechuraba','Santiago',78566671,'carla@gmail.com'


select * from TBL_Clientes

-----------------------------------------------------------------------------------------------
--Procedimiento almacenado que inserta un encabezado de Factura
-----------------------------------------------------------------------------------------------

CREATE PROCEDURE SP_InsertEncabezado
@in_numero_factura int,
@in_tipo_factura VARCHAR(50),
@in_rut_empresa VARCHAR(12),
@in_razon_social VARCHAR(50),
@in_id_cliente int,
@in_fecha DATE,
@in_condicion_pago varchar(50) ,
@in_estado varchar(20)
AS
BEGIN
	INSERT INTO TBL_EncabezadoFactura VALUES(@in_numero_factura,@in_tipo_factura,@in_rut_empresa,
											@in_razon_social,@in_id_cliente,@in_fecha,@in_condicion_pago,
											@in_estado)														
END

exec SP_InsertEncabezado 13,'electronica','18997677-4','Garcia&Ramos',2,'20201111','credito','no emitida'


select * from TBL_EncabezadoFactura


-------------------------------------------------------------------------------------------------------------
--Procedimiento almacenado que inserta en tabla TBL_Detalle
-------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE SP_InsertDetalle

@in_numero_factura INT,
@in_codigo_producto INT,
@in_cantidad_producto INT,
@in_precio_unitario INT,
@in_monto_total NUMERIC (10,2),
@in_monto_neto NUMERIC (10,2),
@in_iva NUMERIC (10,2)

AS
BEGIN
 INSERT TBL_Detalle VALUES(@in_numero_factura,@in_codigo_producto,@in_cantidad_producto,
							@in_precio_unitario,@in_monto_total,@in_monto_neto,@in_iva)
END

EXEC SP_InsertDetalle 12,18185,10,30000,39990,3360504,6385

-----------------------------------------------------------------------------------------------------------------
--Procedimiento almacenado que muestra la informacion completa de la factura
----------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE SP_SelectTodosLosDatos
AS
BEGIN
SELECT TBL_EncabezadoFactura.numero_factura,tipo_factura,rut_empresa,razon_social,TBL_EncabezadoFactura.id_cliente,TBL_Clientes.nombre,
	  TBL_Clientes.rut_cliente,TBL_Clientes.giro,TBL_Clientes.direccion,TBL_Clientes.comuna,TBL_Clientes.ciudad,
		TBL_Clientes.telefono,TBL_Clientes.email,fecha,condicion_pago,
	   estado,TBL_Detalle.codigo_producto,TBL_Productos.descripcion_producto,TBL_Detalle.cantidad_producto,TBL_Detalle.monto_total,
	  TBL_Detalle.monto_neto,TBL_Detalle.iva FROM TBL_EncabezadoFactura INNER JOIN TBL_Detalle
	  ON TBL_EncabezadoFactura.numero_factura = TBL_Detalle.numero_factura INNER JOIN TBL_Productos 
	  ON TBL_Detalle.codigo_producto = TBL_Productos.codigo_producto INNER JOIN TBL_Clientes 
	  ON TBL_Clientes.id_cliente = TBL_EncabezadoFactura.id_cliente

END

exec SP_SelectTodosLosDatos

select * from TBL_EncabezadoFactura 
SELECT * FROM TBL_EncabezadoFactura where numero_factura = 2

update TBL_EncabezadoFactura set estado = 'no_emitida' where numero_factura = 10


CREATE PROCEDURE SP_anularFactura
@in_numero_factura int
AS
BEGIN
update TBL_EncabezadoFactura set estado = 'anulada' where numero_factura = @in_numero_factura

END

sp_helptext view_FacturaCompleta



CREATE PROCEDURE sp_buscaNumeroFactura
@in_numero_factura int
AS
BEGIN
SELECT * FROM TBL_EncabezadoFactura where numero_factura = @in_numero_factura
END

exec sp_buscaNumeroFactura 10



create view view_FacturaCompleta
as 

SELECT TBL_EncabezadoFactura.numero_factura,tipo_factura,rut_empresa,razon_social,TBL_EncabezadoFactura.id_cliente,TBL_Clientes.nombre,
	  TBL_Clientes.rut_cliente,TBL_Clientes.giro,TBL_Clientes.direccion,TBL_Clientes.comuna,TBL_Clientes.ciudad,
		TBL_Clientes.telefono,TBL_Clientes.email,fecha,condicion_pago,
	   estado,TBL_Detalle.codigo_producto,TBL_Productos.descripcion_producto,TBL_Detalle.cantidad_producto,TBL_Detalle.monto_total,
	  TBL_Detalle.monto_neto,TBL_Detalle.iva FROM TBL_EncabezadoFactura INNER JOIN TBL_Detalle
	  ON TBL_EncabezadoFactura.numero_factura = TBL_Detalle.numero_factura INNER JOIN TBL_Productos 
	  ON TBL_Detalle.codigo_producto = TBL_Productos.codigo_producto INNER JOIN TBL_Clientes 
	  ON TBL_Clientes.id_cliente = TBL_EncabezadoFactura.id_cliente


select * from view_FacturaCompleta

select * from TBL_EncabezadoFactura

select * from TBL_Detalle


CREATE PROCEDURE SP_SumaTotalMontoPorFecha
@in_fecha_inicio date,
@in_fecha_fin date
AS
BEGIN
  SELECT TBL_EncabezadoFactura.numero_factura, sum(monto_total ) as Monto_Total_Periodo from TBL_EncabezadoFactura 
		inner join TBL_Detalle on TBL_EncabezadoFactura.numero_factura = TBL_Detalle.numero_factura 
		WHERE fecha between @in_fecha_inicio and  @in_fecha_fin
	    group by TBL_EncabezadoFactura.numero_factura order by TBL_EncabezadoFactura.numero_factura
END

exec SP_SumaTotalMontoPorFecha '1989-03-18','1989-03-18'

exec SP_SumaTotalMontoPorFecha '20201101','20201130'



		