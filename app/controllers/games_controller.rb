class GamesController < ApplicationController

  def index
    @games = Game.where(black_player_id: nil).or(Game.where(white_player_id: nil))
  end

    def create
    @game = Game.create(game_params)
      #TODO: populate game pieces
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

  def update
    if game.valid? && unique_players?
      game.update_attributes game_params
      game.assign_pieces
    return redirect_to game_path game
  end

end

