# criação de task 
namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
      if Rails.env.development?
        show_spinner("apagando banco de dados...") {%x(rails db:drop)}
        show_spinner("criando banco de dados...") {%x(rails db:create)}
        show_spinner("migrando banco de dados...") {%x(rails db:migrate)}
        show_spinner("Populando banco de dados...") {%x(rails dev:add_coins)}
      else 
        puts "você não esta em ambiente de desenvolvimento!"
      end
  end


  desc "Casdastra as moedas"
  task add_coins: :environment do
    show_spinner("Casdastrando moedas...") do
      coins = [
          {description: "Bitcoin",
          acronym: "BTC",
          url_image:"https://static.vecteezy.com/system/resources/previews/008/822/064/original/3d-design-bitcoin-cryptocurrency-white-background-free-png.png"},
          
          {description: "Ethereum",
          acronym: "ETC",
          url_image:"https://upload.wikimedia.org/wikipedia/commons/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png"},
          
          {description: "Dash",
          acronym: "DASH",
          url_image:"https://www.pngall.com/wp-content/uploads/10/Dash-Crypto-Logo-PNG-Cutout.png"}
          ]
      coins.each do |coin|
          Coin.find_or_create_by!(coin)
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
