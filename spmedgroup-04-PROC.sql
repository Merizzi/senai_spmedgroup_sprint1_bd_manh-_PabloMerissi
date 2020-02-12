create proc spUsuario
as
	 begin
		select NomePaciente						 as nome
		,CONVERT(VARCHAR(10),dataNascimento,110) AS ['Data Nascimento']
		,YEAR(GETDATE())-YEAR(dataNascimento)-IIF(MONTH(GETDATE())*32+DAY(GETDATE())<MONTH(dataNascimento)*32+DAY(dataNascimento),1,0) AS IDADE
		,TeleFone								 AS TELEFONE
		,RG										 AS RG
		,CPF									 AS CPF
		,TipoUsuario.Titulo						AS 'TIPO USUÁRIO'
		FROM Prontuario
		INNER JOIN Usuario ON Prontuario.IdUsuario = Usuario.IdUsuario
		INNER JOIN TipoUsuario ON Usuario.IdTipoUsuario = TipoUsuario.IdTipoUsuario
	end
go