#language: pt

@regressivo
Funcionalidade: Cadastrar Cliente
Como um cliente da loja online
Quero cadastrar uma conta
Para efetuar compras

@cadastro_exemplos
Esquema do Cenário: CadastrarClienteComDadosValidos
Dado que acesso a página de login/cadastro
E solicito um novo cadastro para o email <email>
E preencho os campos do formulário com <gender>, <first_name>, <last_name>, <password>, <day>, <month>, <year>, <newsletter>, <company>, <address>, <city>, <state>, <zip>, <mobile>, <addressAlias>
Quando confirmo o cadastro
Então devo ser direcionado à página de minha conta

Exemplos: 
|email                    |gender|first_name|last_name |password  |day |month      |year  |newsletter|company   |address             |city        |state                 |zip    |mobile       |addressAlias  |
|'dfileEailNew@guts.com'  |'masc'|'Joelson' |'Nakamura'|'a9i8es3d'|'20'|'September'|'1980'|'no'      |'TopTeams'|'Financial District'|'New York'  |'New York'            |'11004'|'16466551288'|'Home'        |
|'NovoemailDfile@guts.com'|'fem' |'Julia'   |'Ginger'  |'8a7s98a4'|'15'|'November' |'1990'|'yes'     |'X-Dreams'|'1667 K Street NW'  |'Washington'|'District of Columbia'|'20006'|'48225505699'|'Company'     |