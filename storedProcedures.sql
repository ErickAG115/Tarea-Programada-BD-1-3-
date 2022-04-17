use [ProyectoBD];

--------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS [dbo].[filtrarNombre];

CREATE PROCEDURE [dbo].[filtrarNombre]
	AS BEGIN
		SELECT [Puesto].[ID],[Puesto].[Nombre],[Puesto].[SalarioXHora] FROM [dbo].[Puesto] WHERE [Puesto].[Borrado] = 1 ORDER BY [Puesto].[Nombre] ;           
	END
GO
EXEC filtrarNombre
--------------------------------------------------------------------------------------


DROP PROCEDURE IF EXISTS [dbo].[insertarPuesto];

CREATE PROCEDURE [dbo].[insertarPuesto] @inNombre NVARCHAR(128), @inSalario INT
	AS BEGIN
		INSERT INTO [dbo].[Puesto] ([Nombre], [SalarioXHora]) VALUES	(@inNombre,@inSalario);
	END
GO

--------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS [dbo].[editarPuesto];

CREATE PROCEDURE [dbo].[editarPuesto] @inId INT, @inNombre NVARCHAR(128), @inSalario INT
	AS BEGIN
		UPDATE [dbo].[Puesto] SET [Puesto].[Nombre] = @inNombre,[Puesto].[SalarioXHora] = @inSalario WHERE [Puesto].[ID] = @inId;
	END
GO

--------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS [dbo].[listarEmpleados];

CREATE PROCEDURE [dbo].[listarEmpleados]
	AS BEGIN
		SELECT [Obrero].[ID], [Obrero].[Nombre], [Puesto].[Nombre] FROM [dbo].[Obrero] INNER JOIN [dbo].[Puesto] ON [Obrero].[Puesto] = [Puesto].[Nombre] 
		WHERE [Obrero].[Borrado] = 1  ORDER BY [Puesto].[Nombre];           
	END
GO
EXEC [listarEmpleados]

-------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS [dbo].[insertarEmpleado];

CREATE PROCEDURE [dbo].[insertarEmpleado] @inNombre NVARCHAR(128), @inIdTipoDocIdentidad INT,  @inPuesto INT, @inFechaNacimiento DATE, @inIdDepartamento INT
	AS BEGIN
		INSERT INTO [dbo].[Obrero] ([Nombre], [idTipoDocIdentidad], [Puesto],[FechaNacimiento], [IdDepartamento]) VALUES	(@inNombre,@inIdTipoDocIdentidad, @inPuesto, @inFechaNacimiento, @inIdDepartamento);
	END
GO

EXEC [insertarEmpleado]

---------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS  [dbo].[listarEmpleadosFiltro];

CREATE PROCEDURE  [dbo].[listarEmpleadosFiltro] @inNombre NVARCHAR(128)
	AS BEGIN

		IF (@inNombre = '') -- excepcion forzada del programador
			SELECT [Obrero].[ID], [Obrero].[Nombre], [Puesto].[Nombre] FROM [dbo].[Obrero] INNER JOIN [dbo].[Puesto] ON [Obrero].[Puesto] = [Puesto].[Nombre] 
			WHERE [Obrero].[Borrado] = 1  ORDER BY [Puesto].[Nombre];             
		ELSE
			SELECT [Obrero].[ID], [Obrero].[Nombre], [Puesto].[Nombre] FROM [dbo].[Obrero] INNER JOIN [dbo].[Puesto] ON [Obrero].[Puesto] = [Puesto].[Nombre] 
			WHERE [Obrero].[Borrado] = 1 AND [Obrero].[Nombre]  LIKE '%'+@inNombre+'%' ORDER BY [Puesto].[Nombre] ;

		END
GO


EXEC [dbo].[listarEmpleadosFiltro] @inNombre = 'Dan'


------------------------------------------------------
DROP PROCEDURE IF EXISTS [dbo].[editarEmpleado];

CREATE PROCEDURE [dbo].[editarEmpleado] @inId INT, @inNombre NVARCHAR(128), @inTipoDocIdentidad INT, @inValorDocIdentidad INT, @inFechaNacimiento DATE, @inIdDepartamento INT
	AS BEGIN
		UPDATE [dbo].[Obrero] SET [Obrero].[Nombre] = @inNombre, [Obrero].[IdTipoDocIdentidad] = @inTipoDocIdentidad, [Obrero].[ValorDocIdentidad] = @inValorDocIdentidad, 
		[Obrero].[FechaNacimiento] = @inFechaNacimiento, [Obrero].[IdDepartamento] = @inIdDepartamento WHERE [Obrero].[ID] = @inId;
	END
GO


------------------------------------------------------

DROP PROCEDURE IF EXISTS [dbo].[borrarEmpleado];

CREATE PROCEDURE [dbo].[borrarEmpleado] @inId INT
AS BEGIN
		UPDATE [dbo].[Obrero] SET [Obrero].[Borrado] = 0 WHERE [Obrero].[ID] = @inId;
	END
GO