class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @games = Game.where(black_player_id: nil).or(Game.where(white_player_id: nil))
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    @game.white_player_id = current_user.id
    @game.black_player_id = nil
    @game.save
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    @pieces = @game.pieces
  end

  def join
    @game = Game.find(params[:id])
    @pieces = @game.pieces
    if @game.available_black?
      @game.black_player_id = current_user.id
      @game.save
      redirect_to game_path(@game)
    elsif @game.available_white?
      @game.white_player_id = current_user.id
      @game.save
      redirect_to game_path(@game)
    else
      redirect_to game_path(@game)
    end
  end

private

    def game_params
      params.require(:game).permit(:name)
    end

  def update
      @piece.update_attributes game_params
      game.assign_pieces
      redirect_to game_path game
  end

end

