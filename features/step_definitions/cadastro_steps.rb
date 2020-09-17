Dado('que acesso a página de login\/cadastro') do
    @app.cadastropage.load
  end
  
  Dado('solicito um novo cadastro para o email {string}') do |email|
    @app.cadastropage.iniciar_criacao_conta email
  end
  
  Dado('preencho os campos do formulário com dados aleatórios') do
    @app.cadastropage.preencher_form_com_dados_aleatorios
  end

  Dado('preencho os campos do formulário com dados válidos fixos') do
    @app.cadastropage.preencher_form_com_dados_fixos
  end
  
  Dado('E preencho os campos do formulário com dados aleatórios') do
    @app.cadastropage.preencher_form_com_dados_fixos
  end

  Quando('confirmo o cadastro') do
    @app.cadastropage.confirmar_cadastro
  end
  
  Então('devo ser direcionado à página de minha conta') do
    #expect(@app.minhacontapage.acessou_minha_conta).to be_truthy
    expect(@app.minhacontapage.page_title.text).to eq('My account')
    expect(@app.minhacontapage.account_name.text).to eq(@app.cadastropage.account_name)
  end
                                                                                                                                                                        
  Dado('preencho os campos do formulário com {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}') do | gender, first_name, last_name, password, day, month, year, newsletter, company, address, city, state, zip, mobile, addressAlias |
    @app.cadastropage.preencher_form_com_dados_do_exemplo(gender, first_name, last_name, password, day, month, year, newsletter, company, address, city, state, zip, mobile, addressAlias)
  end

  Dado('preencho os campos do formulário com dados validos padrao') do
    @app.cadastropage.preencher_form_com_dados_do_datafile
  end