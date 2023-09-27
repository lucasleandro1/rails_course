# criação de task 
namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
      if Rails.env.development?
        show_spinner("apagando banco de dados...") {%x(rails db:drop)}
        show_spinner("criando banco de dados...") {%x(rails db:create)}
        show_spinner("migrando banco de dados...") {%x(rails db:migrate)}
        show_spinner("Cadastrando tipos de moedas...") {%x(rails dev:add_mining_types)}
        show_spinner("Populando banco de dados...") {%x(rails dev:add_coins)}
      else 
        puts "você não esta em ambiente de desenvolvimento!"
      end
  end


  desc "Casdastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
      coins = [
          {description: "Bitcoin",
          acronym: "BTC",
          url_image:"https://static.vecteezy.com/system/resources/previews/008/822/064/original/3d-design-bitcoin-cryptocurrency-white-background-free-png.png",
          mining_type: MiningType.find_by(acronym: "PoW") # or where(acronym: "PoW").first
          },
          
          {description: "Ethereum",
          acronym: "ETC",
          url_image:"https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png",
          mining_type: MiningType.all.sample
          },
          
          {description: "Dash",
          acronym: "DASH",
          url_image:"https://www.pngall.com/wp-content/uploads/10/Dash-Crypto-Logo-PNG-Cutout.png",
          mining_type: MiningType.all.sample
          },

          {description: "Iota",
          acronym: "IoT",
          url_image:"https://www.pngall.com/wp-content/uploads/10/IOTA-Crypto-Logo-PNG-Photo.png",
          mining_type: MiningType.all.sample
          },

          {description: "ZCash",
          acronym: "ZEC",
          url_image:"data:image/jpeg;base64,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",
          mining_type: MiningType.all.sample
          }
          ]
      coins.each do |coin|
          Coin.find_or_create_by!(coin)
      end
    end
  end

  desc "Casdastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Casdastrando tipos de moedas...") do
        minging_types = [
          {description: "Proof of Work",acronym: "PoW"},
          {description: "Proof of State",acronym: "PoS"},
          {description: "Proof of Capacity",acronym: "PoC"}
        ]
        minging_types.each do |minging_type|
          MiningType.find_or_create_by!(minging_type)
      end
    end
  end

  private

  def show_spinner(msg_start,msg_finish ="(Concluido!)")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_finish}") 
  end
end
