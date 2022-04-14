use [ProyectoBD];

--------------------------------------------------------------------------------------
DROP PROCEDURE IF EXISTS filtrarNombre;

CREATE PROCEDURE [dbo].[filtrarNombre]
	AS BEGIN
	SELECT [Puesto].[ID],[Puesto].[Nombre],[Puesto].[SalarioXHora] FROM [dbo].[Puesto] ORDER BY [Puesto].[Nombre];           
	END
GO
	
--------------------------------------------------------------------------------------

EXEC filtrarNombre