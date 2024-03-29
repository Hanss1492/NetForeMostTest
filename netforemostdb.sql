USE [master]
GO
/****** Object:  Database [InventarioNetForeMostBD]    Script Date: 7/3/2024 09:24:51 ******/
CREATE DATABASE [InventarioNetForeMostBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventarioNetForeMostBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InventarioNetForeMostBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventarioNetForeMostBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\InventarioNetForeMostBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InventarioNetForeMostBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventarioNetForeMostBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventarioNetForeMostBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET  MULTI_USER 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventarioNetForeMostBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventarioNetForeMostBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [InventarioNetForeMostBD] SET QUERY_STORE = OFF
GO
USE [InventarioNetForeMostBD]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 7/3/2024 09:24:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[CompraID] [int] IDENTITY(1,1) NOT NULL,
	[ProductoID] [int] NULL,
	[CantidadComprada] [int] NULL,
	[PrecioUnitario] [decimal](10, 2) NULL,
	[FechaCompra] [datetime] NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
	[CompraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 7/3/2024 09:24:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[ProductoNombre] [varchar](50) NOT NULL,
	[ProductoDescripcion] [varchar](500) NULL,
	[CantidadDisponible] [int] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 7/3/2024 09:24:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas](
	[VentaID] [int] IDENTITY(1,1) NOT NULL,
	[ProductoID] [int] NULL,
	[CantidadVendida] [int] NULL,
	[FechaVenta] [datetime] NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[VentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Productos] ON 

INSERT [dbo].[Productos] ([ProductoID], [ProductoNombre], [ProductoDescripcion], [CantidadDisponible]) VALUES (1, N'Teclado Xtech', N'Teclado USB', 8)
INSERT [dbo].[Productos] ([ProductoID], [ProductoNombre], [ProductoDescripcion], [CantidadDisponible]) VALUES (2, N'Laptop Dell', N'12RAM - I7 15002', 90)
INSERT [dbo].[Productos] ([ProductoID], [ProductoNombre], [ProductoDescripcion], [CantidadDisponible]) VALUES (3, N'Monitor Kooru', N'32" - color negro  full HD2k', 80)
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Productos] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Productos]
GO
ALTER TABLE [dbo].[Ventas]  WITH CHECK ADD  CONSTRAINT [FK_Ventas_Productos] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Productos] ([ProductoID])
GO
ALTER TABLE [dbo].[Ventas] CHECK CONSTRAINT [FK_Ventas_Productos]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarInventario]    Script Date: 7/3/2024 09:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarInventario]
AS
BEGIN
    BEGIN TRY
        SELECT ProductoNombre, CantidadDisponible
        FROM Productos;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[GenerarInformeTransacciones]    Script Date: 7/3/2024 09:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GenerarInformeTransacciones]
AS
BEGIN
    BEGIN TRY
        SELECT 'Compra' AS TipoTransaccion, 
               P.ProductoNombre AS NombreProducto, 
               C.CantidadComprada AS Cantidad, 
               C.PrecioUnitario AS PrecioUnitario,
               C.FechaCompra AS Fecha
        FROM Compras C
        INNER JOIN Productos P ON C.ProductoID = P.ProductoID
        UNION ALL
        SELECT 'Venta' AS TipoTransaccion, 
               P.ProductoNombre AS NombreProducto, 
               V.CantidadVendida AS Cantidad, 
               NULL AS PrecioUnitario,
               V.FechaVenta AS Fecha
        FROM Ventas V
        INNER JOIN Productos P ON V.ProductoID = P.ProductoID
        ORDER BY Fecha DESC;
    END TRY
    BEGIN CATCH
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductoPorId]    Script Date: 7/3/2024 09:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerProductoPorId]
	-- Add the parameters for the stored procedure here
	@productoID as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select ProductoID, ProductoNombre, ProductoDescripcion, CantidadDisponible from Productos where ProductoID = @productoID
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCompra]    Script Date: 7/3/2024 09:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarCompra]
    @ProductoID INT,
    @CantidadComprada INT,
    @PrecioUnitario DECIMAL(10, 2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN;
        
        INSERT INTO Compras (ProductoID, CantidadComprada, PrecioUnitario)
        VALUES (@ProductoID, @CantidadComprada, @PrecioUnitario);
        
        UPDATE Productos
        SET CantidadDisponible = CantidadDisponible + @CantidadComprada
        WHERE ProductoID = @ProductoID;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarVenta]    Script Date: 7/3/2024 09:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarVenta]
    @ProductoID INT,
    @CantidadVendida INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRAN;

        IF EXISTS (SELECT 1 FROM Productos WHERE ProductoID = @ProductoID AND CantidadDisponible >= @CantidadVendida)
        BEGIN
            INSERT INTO Ventas (ProductoID, CantidadVendida)
            VALUES (@ProductoID, @CantidadVendida);

            UPDATE Productos
            SET CantidadDisponible = CantidadDisponible - @CantidadVendida
            WHERE ProductoID = @ProductoID;
        END
        ELSE
        BEGIN
            RAISERROR('No hay suficiente cantidad disponible para realizar la venta', 16, 1);
        END

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;
        THROW;
    END CATCH;
END;
GO
USE [master]
GO
ALTER DATABASE [InventarioNetForeMostBD] SET  READ_WRITE 
GO
