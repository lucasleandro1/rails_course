class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails [cookie]"
    @curso = params[:curso]
    @meu_nome = params[:nome]
  end
end


