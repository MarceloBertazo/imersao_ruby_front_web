class CadastroPage < SitePrism::Page
    #adiciona complemento da URL pra acessar a área de cadastro de usuário
    set_url '?controller=authentication&back=my-account'
    #mapeamento do campo email
    element :email_create_account_field, '#email_create'
    #mapeamento do botão de click para cadastrar e-mail
    element :create_account_btn, '#SubmitCreate'
    
    
    #Mapeamento dos dados cadastrais
    element :title_masculino_rd, '#id_gender1'
    element :title_feminino_rd, '#id_gender2'
    element :first_name_field, '#customer_firstname'
    element :last_name_field, '#customer_lastname'
    element :password_field, '#passwd'
    element :day_select, '#uniform-days'
    elements :day_options, '#uniform-days option'
    element :month_select, '#uniform-months'
    elements :month_options, '#uniform-months option'
    element :year_select, '#uniform-years'
    elements :year_options, '#uniform-years option'
    element :newsletter_checkbox, '#uniform-newsletter'
    element :address_field, '#address1'
    element :city_field, '#city'
    element :state_select, '#uniform-id_state'
    elements :state_options, '#uniform-id_state option'
    element :zip_cod_field, '#postcode'
    element :mobile_phone_field, '#phone_mobile'
    element :address_alias_field, '#alias'

    #mapeamento do botão confirmar cadastro 
    element :register_btn, '#submitAccount'

    #variável utilizando @ é uma variável de instância, deixa de existir após a execução do método
    #variável utilizando @@ é uma variável de classe, existirá por todo ciclo do teste
    #variável utilizando $ é uma variável global, poderá ser utilizada em qualquer lugar no código.

    
    def iniciar_criacao_conta(email)
       @email = email.eql?('aleatorio') ? Faker::Internet.email(domain: 'guts') : email 
       email_create_account_field.set @email
       #sleep (5)
       create_account_btn.click
    end

    def preencher_form_com_dados_fixos
        title_masculino_rd.set true
        #Begin first name data
        @@first_name = 'Marcelo'
        first_name_field.set @@first_name
        #End first name data
        #Begin last name data
        @@last_name = 'Paz'
        last_name_field.set @@last_name
        #End last name data
        password_field.set '12345'
        #Begin date data
        day_select.click
        option = day_options.find {|option| option.text.include?("11 ")}
        option.click
        #End date data
        #Begin month data
        month_select.click
        option = month_options.find {|option| option.text.include?("November ")}
        option.click
        #End month data
        #Begin year data
        year_select.click
        option = year_options.find {|option| option.text.include?("2011 ")}
        option.click
        #End year data
        newsletter_checkbox.set true
        address_field.set 'Rua A, 15'
        city_field.set 'Porto Alegre'
        #Begin state data
        state_select.click
        option = state_options.find{|option| option.text.include?("Iowa")}
        option.click
        #End state data
        zip_cod_field.set '12345'
        mobile_phone_field.set '5551988776655'
        address_alias_field.set 'casa'
    end

    def preencher_form_com_dados_aleatorios
        title_masculino_rd.set true
        #Begin first name data
        @@first_name = Faker::Name.first_name
        first_name_field.set @@first_name
        #End first name data
        #Begin last name data
        @@last_name = Faker::Name.last_name
        last_name_field.set @@last_name
        #End last name data
        password_field.set Faker::Internet.password(min_length: 5, max_length: 10, mix_case: true, special_characters: true)
        #Begin date data
        day_select.click
        option = day_options.find {|option| option.text.include?("11 ")}
        option.click
        #End date data
        #Begin month data
        month_select.click
        option = month_options.find {|option| option.text.include?("November ")}
        option.click
        #End month data 
        #Begin year data
        year_select.click
        option = year_options.find {|option| option.text.include?("2011 ")}
        option.click
        #End year data
        newsletter_checkbox.set true
        address_field.set 'Rua A, 15'
        city_field.set 'Porto Alegre'
        #Begin state data
        state_select.click
        option = state_options.find{|option| option.text.include?("Iowa")}
        option.click
        #End state data
        zip_cod_field.set '12345'
        mobile_phone_field.set Faker::PhoneNumber.cell_phone_in_e164
        address_alias_field.set 'casa'
    end

    def preencher_form_com_dados_do_exemplo (gender, first_name, last_name, password, day, month, year, newsletter, company, address, city, state, zip, mobile, addressAlias)
        gender.eql?('fem') ? title_feminino_rd.set(true) :  title_masculino_rd.set(true)
        @@first_name = first_name
        first_name_field.set @@first_name
        #End first name data
        #Begin last name data
        @@last_name = last_name
        last_name_field.set @@last_name
        #End last name data
        password_field.set password
        #Begin date data
        day_select.click
        option = day_options.find {|option| option.text.include?(day)}
        option.click
        #End date data
        #Begin month data
        month_select.click
        option = month_options.find {|option| option.text.include?(month)}
        option.click
        #End month data 
        #Begin year data
        year_select.click
        option = year_options.find {|option| option.text.include?(year)}
        option.click
        #End year data
        #Begin newsletter box
        unless newsletter.eql?('no')
            newsletter_checkbox.set true
        end
        #End newsletter box
        address_field.set address
        city_field.set city
        #Begin state data
        state_select.click
        option = state_options.find{|option| option.text.include?(state)}
        option.click
        #End state data
        zip_cod_field.set zip
        mobile_phone_field.set mobile
        address_alias_field.set addressAlias
    end

    def account_name
       "#{@@first_name} #{@@last_name}" 
    end

    def confirmar_cadastro
        register_btn.click
    end
end
