# criação de task 
namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
      if Rails.env.development?
        show_spinner("apagando banco de dados") {%x(rails db:drop)}
        show_spinner("criando banco de dados") {%x(rails db:create)}
        show_spinner("migrando banco de dados") {%x(rails db:migrate)}
        show_spinner("populando banco de dados") {%x(rails db:seed)} 
      else 
        puts "você não esta em ambiente de desenvolvimento!"
      end
  end
  private
  def show_spinner(msg_start,msg_finish="concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_finish}") 
  end
end
