use [ProyectoBD];

--------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS [dbo].[filtrarNombre];

CREATE PROCEDURE [dbo].[filtrarNombre]
	AS BEGIN
		SELECT [Puesto].[ID],[Puesto].[Nombre],[Puesto].[SalarioXHora] FROM [dbo].[Puesto] ORDER BY [Puesto].[Nombre];           
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
		SELECT [Obrero].[ID], [Obrero].[Nombre], [Puesto].[Nombre] FROM [dbo].[Obrero] INNER JOIN [dbo].[Puesto] ON [Obrero].[Puesto] = [Puesto].[ID]  ORDER BY [Puesto].[Obrero];           
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