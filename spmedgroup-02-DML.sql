--Inicio DML

insert into Especialidade(Especialidade)
values ('Acunputura'),
	   ('Anestesiologia'),
	   ('Angiologia'),
	   ('Cardiologia'),
	   ('Cirurgia Cardiovascular'),
	   ('Cirurgia da Mão'),
	   ('Cirurgia do Aparelho Digestivo'),
	   ('Cirurgia Geral'),
	   ('Cirurgia Pediatrica'),
	   ('Cirurgia Plastica'),
	   ('Cirurgia Toracica'),
	   ('Cirurgia Vascular'),
	   ('Dermatologia'),
	   ('Radioterapia'),
	   ('Urologia'),
	   ('Pediatria'),
	   ('Psiquiatria');
	   
insert into Clinica (CNPJ, Endereco, NomeFantasia, RazaoSocial, HorarioFuncionamento)
values ('84400902000130','Av. Barão Limeira, 532, São Paulo, SP','Clinica Possarle','SP Medical Group','06:30 as 22:30');

insert into TipoUsuario (Titulo)
values ('Médico'),
	   ('Usuario'),
	   ('Administrador');

insert into Situacao (Titulo)
values ('Realizada'),
	   ('Cancelada'),
	   ('Agendada');

insert into	Usuario (Email, Senha, IdTipoUsuario)
values ('pablo.m@hotmail.com', '12345678p', '3'),
	   ('ricardo.lemos@spmedicalgroup.com.br','12345678','1'),
	   ('roberto.possarle@spmedicalgroup.com.br','12345678','1'),
	   ('helena.souza@spmedicalgroup.com.br','12345678','1'),
	   ('ligia@gmail.com','12345678','2'),
	   ('alexandre@gmail.com','12345678','2'),
	   ('fernando@gmail.com','12345678','2'),
	   ('henrique@gmail.com','12345678','2'),
	   ('joao@hotmail.com','12345678','2'),
	   ('bruno@gmail.com','12345678','2'),
	   ('mariana@outlook.com','12345678','2');


insert into Prontuario (NomePaciente, Telefone, RG, CPF, Endereco, DataNascimento, IdUsuario)
values ('Ligia','1134567654','435225435','94839859000','Rua Estado de Israel 240, São Paulo, Estado de São Paulo, 04022-000','13/10/1983','5'),
	   ('Alexandre','11987656543','326543457','73556944057','Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200','23/07/2001','6'),
	   ('Fernando','11972084453','546365253','16839338002','Av. Ibirapuera - Indianópolis, 2927,  São Paulo - SP, 04029-200','10/10/1978','7'),
	   ('Henrique','1134566543','543663625','14332654765','R. Vitória, 120 - Vila Sao Jorge, Barueri - SP, 06402-030','13/10/1985','8'),
	   ('João','1176566377','325444441','91305348010','R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeirão Pires - SP, 09405-380','27/08/1975','9'),
	   ('Bruno','11954368769','545662667','79799299004','Alameda dos Arapanés, 945 - Indianópolis, São Paulo - SP, 04524-001','21/03/1972','10'),
	   ('Mariana','1192032286','545662668','13771913039','R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407-140','05/03/2018','11');

insert into Medico(CRM, Nome, IdClinica, IdUsuario, IdEspecialidade)
values ('54356SP','Ricardo Lemos','1','2','2'),
	   ('53452SP','Roberto Possarle','1','3','17'),
	   ('65463SP','Helena Strada','1','4','16');

insert into Consulta (DataConsulta, Descricao, IdMedico, IdSituacao, IdProntuario)
values ('20/01/2020 15:00:00','Azazazaa','3','1','7'),
	   ('06/01/2020  10:00:00','Azazazaa','2','2','2'),
	   ('07/02/2020  11:00:00','Azazazaa','2','1','3'),
	   ('06/02/2018  10:00:00','Azazazaa','2','1','2'),
	   ('07/02/2019  11:00:45','Azazazaa','1','2','4'),
	   ('08/03/2020  15:00:00','Azazazaa','3','3','7'),
	   ('09/03/2020  11:00:45','Azazazaa','1','3','4');
-- FIM DML


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