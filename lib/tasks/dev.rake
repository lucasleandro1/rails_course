# criação de task 
namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
      if Rails.env.development?
        spinner = TTY::Spinner.new("[:spinner] Executando tarefas ...", format: :pulse_2)
        spinner.auto_spin
        puts %x(rails db:drop db:create db:migrate db:seed)
        spinner.stop('concluido com sucesso!!')
      else 
        puts "você não esta em ambiente de desenvolvimento!"
      end
  end


end
