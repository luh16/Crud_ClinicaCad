CREATE procedure ObterCadastro
as
begin 
    Select MedicoId, Nome, CRM, Telefone, Cidade, Uf, Especialidade from Cadastro
	end