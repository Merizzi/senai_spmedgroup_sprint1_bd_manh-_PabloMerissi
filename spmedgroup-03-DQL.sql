--Inicio DQL
select Consulta.IDConsulta, Consulta.DataConsulta, Consulta.Descricao, Prontuario.NomePaciente, Prontuario.CPF, Prontuario.RG, Medico.Nome, Medico.CRM, Clinica.RazaoSocial, Clinica.Endereco,
Situacao.Titulo as Situacao from Consulta
inner join Prontuario on Consulta.IdProntuario = Prontuario.IDProntuario
inner join Medico on Consulta.IdMedico = Medico.IDMedico
inner join Situacao on Consulta.IdSituacao = Situacao.IDSituacao
inner join Clinica on Medico.IdClinica = Clinica.IDClinica;

select Prontuario.IDProntuario, Prontuario.NomePaciente, Prontuario.Telefone, Prontuario.RG, Prontuario.CPF, Prontuario.Endereco, Prontuario.DataNascimento, Usuario.Email, Usuario.Senha from Prontuario
inner join Usuario on Prontuario.IdUsuario = Usuario.IDUsuario ;

select Usuario.IDUsuario, Usuario.IdTipoUsuario, Usuario.Email, Usuario.Senha, TipoUsuario.Titulo from Usuario inner join TipoUsuario on Usuario.IdTipoUsuario = TipoUsuario.IDTipoUsuario;

select Medico.IDMedico, Medico.CRM, Medico.Nome, Clinica.RazaoSocial, Clinica.Endereco, Usuario.Email, Usuario.Senha, Especialidade.Especialidade from Medico
inner join Clinica on Medico.IdClinica = Clinica.IDClinica
inner join Usuario on Medico.IdUsuario = Usuario.IDUsuario
inner join Especialidade on Medico.IdEspecialidade = Especialidade.IDEspecialidade;

select count (IDUsuario) as QuantidadeUsuarios
from Usuario;

select COUNT (IDMedico) as QtdMedicosEspecialidades
from Medico
where IDEspecialidade=17;

Select * from Prontuario;
select NomePaciente, convert(varchar(10), DataNascimento, 101) as 'Data Nascimento',TeleFone,RG,CPF,IdUsuario from Prontuario 

select convert(varchar(10), getdate(), 101) as [MM/DD/YYYY];

select * from TipoUsuario order by IdTipoUsuario;
select * from Situacao;
select * from Especialidade order by IdEspecialidade;

exec spUsuario;
--FIM DQL