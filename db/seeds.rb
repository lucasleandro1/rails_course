# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# comando para recriar o banco de dados: rails db:drop db:create db:migrate db:seed
puts "Cadastrando moedas"
Coin.create!(
    [
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
)

puts "Moedas cadastradas com sucesso"
# rails db:drop db:create db:migrate db:seed
