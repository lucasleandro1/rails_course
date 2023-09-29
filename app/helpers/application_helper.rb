module ApplicationHelper
    def data_br(data_us)
        data_us.strftime("%d/%m/%Y")
    end
    def nomedoapp()
        "CRYPTO WALLET APP"
    end
    def ambiente_rails
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rails.env.production?
            "Produção"
        else
            "Teste"
        end
    end

    def locale(locale)
        if I18n.locale == :en
            "English"
        else 
            "Português-br"
        end
    end
end
