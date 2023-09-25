class WelcomeController < ApplicationController
  def index
    pry
    @meu_nome = params[:nome]
  end
end


