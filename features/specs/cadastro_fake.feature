#language: pt

Funcionalidade: Cadastrar Cliente
Como um cliente da loja online
Quero cadastrar uma conta
Para efetuar compras

@cadastro_dados_fake
Cenário: CadastrarClienteDadosValidosFixos
Dado que acesso a página de login/cadastro
E solicito um novo cadastro para o email 'aleatorio'
E preencho os campos do formulário com dados aleatórios
Quando confirmo o cadastro
Então devo ser direcionado à página de minha conta
