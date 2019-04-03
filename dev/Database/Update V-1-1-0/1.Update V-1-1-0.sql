
USE [PuntoVentaDB]
GO
/****** Object:  Table [dbo].[tbl_Producto]    Script Date: 04/02/2019 21:58:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Producto](
	[productoId] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](250) NOT NULL,
	[precio] [decimal](9, 2) NOT NULL,
	[stock] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Producto] PRIMARY KEY CLUSTERED 
(
	[productoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[tbl_Usuario]    Script Date: 04/02/2019 21:58:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tbl_Usuario](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[nombreCompleto] [nvarchar](250) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Usuario] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  StoredProcedure [dbo].[usp_PROD_DeleteProducto]    Script Date: 04/02/2019 21:58:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PROD_DeleteProducto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PROD_DeleteProducto]
GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_GetProductoById]    Script Date: 04/02/2019 21:58:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PROD_GetProductoById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PROD_GetProductoById]
GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_GetProductos]    Script Date: 04/02/2019 21:58:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PROD_GetProductos]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PROD_GetProductos]
GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_InsertProducto]    Script Date: 04/02/2019 21:58:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PROD_InsertProducto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PROD_InsertProducto]
GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_UpdateProducto]    Script Date: 04/02/2019 21:58:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_PROD_UpdateProducto]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_PROD_UpdateProducto]
GO

/****** Object:  StoredProcedure [dbo].[usp_SEG_GetUsusarioByUsername]    Script Date: 04/02/2019 21:58:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_SEG_GetUsusarioByUsername]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_SEG_GetUsusarioByUsername]
GO


/****** Object:  StoredProcedure [dbo].[usp_PROD_DeleteProducto]    Script Date: 04/02/2019 21:58:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 23/04/2018
-- Description:	Elimina un registro de producto
-- =============================================
CREATE PROCEDURE [dbo].[usp_PROD_DeleteProducto]
	@intProductoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM [dbo].[tbl_Producto]
	WHERE [productoId] = @intProductoId

END

GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_GetProductoById]    Script Date: 04/02/2019 21:58:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 23/04/2018
-- Description:	Obtiene un registro de producto por id
-- =============================================
CREATE PROCEDURE [dbo].[usp_PROD_GetProductoById]
	@intProductoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [productoId]
	  ,[nombre]
	  ,[precio]
	  ,[stock]
	FROM [dbo].[tbl_Producto]
	WHERE [productoId] = @intProductoId

END

GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_GetProductos]    Script Date: 04/02/2019 21:58:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 23/04/2018
-- Description:	Obtiene todos los registros de producto
-- =============================================
CREATE PROCEDURE [dbo].[usp_PROD_GetProductos]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [productoId]
	  ,[nombre]
	  ,[precio]
	  ,[stock]
	FROM [dbo].[tbl_Producto]

END

GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_InsertProducto]    Script Date: 04/02/2019 21:58:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 23/04/2018
-- Description:	Inserta un registro de producto
-- =============================================
CREATE PROCEDURE [dbo].[usp_PROD_InsertProducto]
	@varNombre		NVARCHAR(250),
	@decPrecio		DECIMAL(9,2),
	@stock			INT,
	@intProductoId	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tbl_Producto]
           ([nombre]
           ,[precio]
           ,[stock])
     VALUES
           (@varNombre
           ,@decPrecio
           ,@stock)
           
    SET @intProductoId = SCOPE_IDENTITY()

END

GO

/****** Object:  StoredProcedure [dbo].[usp_PROD_UpdateProducto]    Script Date: 04/02/2019 21:58:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 23/04/2018
-- Description:	Actualiza un registro de producto
-- =============================================
CREATE PROCEDURE [dbo].[usp_PROD_UpdateProducto]
	@varNombre		NVARCHAR(250),
	@decPrecio		DECIMAL(9,2),
	@stock			INT,
	@intProductoId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE [dbo].[tbl_Producto]
	   SET [nombre] = @varNombre
		  ,[precio] = @decPrecio
		  ,[stock] = @stock
	WHERE [productoId] = @intProductoId

END

GO

/****** Object:  StoredProcedure [dbo].[usp_SEG_GetUsusarioByUsername]    Script Date: 04/02/2019 21:58:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Jose Carlos Gutierrez
-- Create date: 16/04/2018
-- Description: Obtiene un usuario desde su nombre de usuario
-- =============================================
CREATE PROCEDURE [dbo].[usp_SEG_GetUsusarioByUsername]
	@varUsername	NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [userId]
		  ,[nombreCompleto]
		  ,[username]
		  ,[password]
	FROM [dbo].[tbl_Usuario]
	WHERE [username] = @varUsername



END

GO

DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,1
           ,0)
GO

