class GamesController < ApplicationController

  def index
    @game = Game.all
  end

    def create
    @game = Game.create(game_params)
      redirect_to game_path(@game)
    end

    def new
      @game = Game.new
    end

    def show
      @game = Game.find(params[:id])
    end

private 
    
    def game_params
      params.require(:game).permit(:name)
    end

end
