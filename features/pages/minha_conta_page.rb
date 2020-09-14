class MinhaContaPage < SitePrism::Page
    set_url '?controller=my-account'

    element :page_title, '.navigation_page'
    element :account_name, '[title="View my customer account"]'


    def  acessou_minha_conta
        page_title.text.eql?('My account') && account_name.text.eql?('Marcelo Paz')
    end
end
