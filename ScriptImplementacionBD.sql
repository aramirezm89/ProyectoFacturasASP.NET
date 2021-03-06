USE [master]
GO
/****** Object:  Database [PROYECTO_FACTURA]    Script Date: 19-11-2020 13:10:08 ******/
CREATE DATABASE [PROYECTO_FACTURA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PROYECTO_FACTURA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PROYECTO_FACTURA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PROYECTO_FACTURA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PROYECTO_FACTURA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PROYECTO_FACTURA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PROYECTO_FACTURA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PROYECTO_FACTURA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET ARITHABORT OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET  MULTI_USER 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PROYECTO_FACTURA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PROYECTO_FACTURA] SET QUERY_STORE = OFF
GO
USE [PROYECTO_FACTURA]
GO
/****** Object:  Table [dbo].[TBL_Productos]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Productos](
	[codigo_producto] [int] NOT NULL,
	[descripcion_producto] [varchar](50) NOT NULL,
	[UM] [varchar](5) NOT NULL,
	[precio_unitario] [numeric](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Clientes]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Clientes](
	[id_cliente] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[rut_cliente] [varchar](12) NOT NULL,
	[giro] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[comuna] [varchar](50) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
	[telefono] [int] NOT NULL,
	[email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_EncabezadoFactura]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_EncabezadoFactura](
	[numero_factura] [int] NOT NULL,
	[tipo_factura] [varchar](50) NOT NULL,
	[rut_empresa] [varchar](12) NOT NULL,
	[razon_social] [varchar](50) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[condicion_pago] [varchar](50) NOT NULL,
	[estado] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[numero_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_Detalle]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Detalle](
	[numero_factura] [int] NOT NULL,
	[codigo_producto] [int] NOT NULL,
	[cantidad_producto] [int] NOT NULL,
	[precio_unitario] [int] NOT NULL,
	[monto_total] [numeric](10, 2) NOT NULL,
	[monto_neto] [numeric](10, 2) NOT NULL,
	[iva] [numeric](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_FacturaCompleta]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[view_FacturaCompleta]
as 

SELECT TBL_EncabezadoFactura.numero_factura,tipo_factura,rut_empresa,razon_social,TBL_EncabezadoFactura.id_cliente,TBL_Clientes.nombre,
	  TBL_Clientes.rut_cliente,TBL_Clientes.giro,TBL_Clientes.direccion,TBL_Clientes.comuna,TBL_Clientes.ciudad,
		TBL_Clientes.telefono,TBL_Clientes.email,fecha,condicion_pago,
	   estado,TBL_Detalle.codigo_producto,TBL_Productos.descripcion_producto,TBL_Detalle.cantidad_producto,TBL_Detalle.monto_total,
	  TBL_Detalle.monto_neto,TBL_Detalle.iva FROM TBL_EncabezadoFactura INNER JOIN TBL_Detalle
	  ON TBL_EncabezadoFactura.numero_factura = TBL_Detalle.numero_factura INNER JOIN TBL_Productos 
	  ON TBL_Detalle.codigo_producto = TBL_Productos.codigo_producto INNER JOIN TBL_Clientes 
	  ON TBL_Clientes.id_cliente = TBL_EncabezadoFactura.id_cliente
GO
/****** Object:  Table [dbo].[TBL_Empresas]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_Empresas](
	[rut_empresa] [varchar](12) NOT NULL,
	[nombre_empresa] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rut_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBL_UsuariosRegistrados]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_UsuariosRegistrados](
	[usuario] [varchar](50) NULL,
	[pass] [varchar](20) NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](100) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBL_Detalle]  WITH CHECK ADD  CONSTRAINT [fk_TBL_EncabezadoFactura] FOREIGN KEY([numero_factura])
REFERENCES [dbo].[TBL_EncabezadoFactura] ([numero_factura])
GO
ALTER TABLE [dbo].[TBL_Detalle] CHECK CONSTRAINT [fk_TBL_EncabezadoFactura]
GO
ALTER TABLE [dbo].[TBL_Detalle]  WITH CHECK ADD  CONSTRAINT [fk_TBL_Productos] FOREIGN KEY([codigo_producto])
REFERENCES [dbo].[TBL_Productos] ([codigo_producto])
GO
ALTER TABLE [dbo].[TBL_Detalle] CHECK CONSTRAINT [fk_TBL_Productos]
GO
ALTER TABLE [dbo].[TBL_EncabezadoFactura]  WITH CHECK ADD  CONSTRAINT [fk_TBL_Cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[TBL_Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[TBL_EncabezadoFactura] CHECK CONSTRAINT [fk_TBL_Cliente]
GO
ALTER TABLE [dbo].[TBL_EncabezadoFactura]  WITH CHECK ADD  CONSTRAINT [fk_TBL_Empresas] FOREIGN KEY([rut_empresa])
REFERENCES [dbo].[TBL_Empresas] ([rut_empresa])
GO
ALTER TABLE [dbo].[TBL_EncabezadoFactura] CHECK CONSTRAINT [fk_TBL_Empresas]
GO
/****** Object:  StoredProcedure [dbo].[SP_anularFactura]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_anularFactura]
@in_numero_factura int
AS
BEGIN
update TBL_EncabezadoFactura set estado = 'anulada' where numero_factura = @in_numero_factura

END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscaNumeroFactura]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_buscaNumeroFactura]
@in_numero_factura int
AS
BEGIN
SELECT * FROM TBL_EncabezadoFactura where numero_factura = @in_numero_factura
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarEmpresa]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SP_BuscarEmpresa]
AS
BEGIN
	select * from TBL_Empresas
END
GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarUsuariosRegistrados]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarUsuariosRegistrados]
@in_usuario VARCHAR(50),
@in_paass   Varchar(20)
AS
BEGIN
 SELECT * FROM TBL_UsuariosRegistrados where usuario = @in_usuario and pass  =@in_paass
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertCliente]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertCliente]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertDetalle]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertDetalle]

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
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertEmpresa]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertEmpresa]

@in_rut_empresa VARCHAR(12),
@in_nombre_empresa VARCHAR(50)
AS
BEGIN
 INSERT INTO TBL_Empresas VALUES(@in_rut_empresa,@in_nombre_empresa)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertEncabezado]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertEncabezado]
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


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertProductos]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_InsertProductos]
@in_codigo_producto int,
@in_descripcion_producto VARCHAR(50) ,
@in_UM VARCHAR(5) ,
@in_precio_unitario NUMERIC(10,2) 
AS
BEGIN
 INSERT INTO TBL_Productos VALUES(@in_codigo_producto,@in_descripcion_producto,@in_UM,@in_precio_unitario)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SelectTodosLosDatos]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_SelectTodosLosDatos]
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
GO
/****** Object:  StoredProcedure [dbo].[SP_SumaTotalMontoPorFecha]    Script Date: 19-11-2020 13:10:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SumaTotalMontoPorFecha]
@in_fecha_inicio date,
@in_fecha_fin date
AS
BEGIN
  SELECT TBL_EncabezadoFactura.numero_factura, sum(monto_total ) as Monto_Total_Periodo from TBL_EncabezadoFactura 
		inner join TBL_Detalle on TBL_EncabezadoFactura.numero_factura = TBL_Detalle.numero_factura 
		WHERE fecha between @in_fecha_inicio and  @in_fecha_fin
	    group by TBL_EncabezadoFactura.numero_factura order by TBL_EncabezadoFactura.numero_factura
END
GO
USE [master]
GO
ALTER DATABASE [PROYECTO_FACTURA] SET  READ_WRITE 
GO
