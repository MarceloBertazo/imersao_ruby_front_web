class CadastroPage < SitePrism::Page
    #adiciona complemento da URL pra acessar a área de cadastro de usuário
    set_url '?controller=authentication&back=my-account'
    #mapeamento do campo email
    element :email_create_account_field, '#email_create'
    #mapeamento do botão de click para cadastrar e-mail
    element :create_account_btn, '#SubmitCreate'
    
    
    #Mapeamento dos dados cadastrais
    #mapeamento do título
    element :title_masculino_rd, '#id_gender1'
    #mapeando o campo primeiro nome
    element :first_name_field, '#customer_firstname'
    #mapeando o campo último nome
    element :last_name_field, '#customer_lastname'
    ##mapeando o campo password
    element :password_field, '#passwd'
    #mapeando o campo de seleção de dia de nascimento
    element :day_select, '#uniform-days'
    elements :day_options, '#uniform-days option'
    #mapeando o campo de seleção de mês de nascimento
    element :month_select, '#uniform-months'
    elements :month_options, '#uniform-months option'
    #mapeando o campo de seleção de ano de nascimento
    element :year_select, '#uniform-years'
    elements :year_options, '#uniform-years option'
    #mapeando o check box newsleatter
    element :newsletter_checkbox, '#uniform-newsletter'
    #mapeando o campo endereço
    element :address_field, '#address1'
    #mapeando o campo cidade
    element :city_field, '#city'
    #mapeando o campo de seleção de estado
    element :state_select, '#uniform-id_state'
    elements :state_options, '#uniform-id_state option'
    #mapeamento o campo CEP
    element :zip_cod_field, '#postcode'
    #mapeando o campo de celular
    element :mobile_phone_field, '#phone_mobile'
    #mapeando o nome do endereço
    element :address_alias_field, '#alias'

    #mapeamento do botão confirmar cadastro
    element :register_btn, '#submitAccount'

    def iniciar_criacao_conta(email)
       email_create_account_field.set email
       #wait '5000'
       create_account_btn.click 
       #wait '5000'
    end

    def preencher_form_com_dados_fixos
        #selecionar o radio de título
        title_masculino_rd.set true
        #Preencher o campo primeiro nome
        first_name_field.set 'Marcelo'
        #Preencher o campo último nome
        last_name_field.set 'Paz'
        #Preencher o campo password
        password_field.set '12345'
        #Selecionar o campo de seleção de dia de nascimento
        day_select.click
        option = day_options.find {|option| option.text.include?("11 ")}
        option.click
        #Selecionar o campo de seleção de mês de nascimento
        month_select.click
        option = month_options.find {|option| option.text.include?("November ")}
        option.click
        #Selecionar o campo de seleção de ano de nascimento
        year_select.click
        option = year_options.find {|option| option.text.include?("2011 ")}
        option.click
        #Marcar o check box newsleatter
        newsletter_checkbox.set true
        #Preencher o campo endereço
        address_field.set 'Rua A, 15'
        #Preencher o campo cidade
        city_field.set 'Porto Alegre'
        #Selecionar o campo de seleção de estado
        state_select.click
        option = state_options.find{|option| option.text.include?("Iowa")}
        option.click
        #Preencher o campo CEP
        zip_cod_field.set '12345'
        #Preencher o campo de celular
        mobile_phone_field.set '5551988776655'
        #Preencher o nome do endereço
        address_alias_field.set 'casa'
    end

    def confirmar_cadastro
        register_btn.click
    end
end
