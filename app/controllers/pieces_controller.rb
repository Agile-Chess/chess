# frozen_string_literal: true

# Pieces controller to manage activities
class PiecesController < ApplicationController
 # before_action :find_piece,
  #before_action :verify_two_players, :verify_player_turn,
 # before_action :verify_valid_move
 # before_action :require_authorized_for_current_piece, only: [:update]

  def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
    render 'games/show'
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    x_path = @piece.x_position
    y_path = @piece.y_position
    
      @piece.update(piece_params)
      respond_to do |format|
        format.html {render :show }
        format.json { render json: @piece, status: :ok }
      end
     

   # if !your_turn?
    #  render text: 'It must be your turn',
    #  status: :unauthorized
    

  end
  



private

def find_piece
  @piece = Piece.find(params[:id])
  @game = @piece.game

end

def verify_valid_move
  return if @piece.valid_move?(x_position,y_position)
end

def piece_params
   params.permit(
    :x_position, :y_position, :type, :color
    )
end

def current_piece
  @current_piece ||= piece.find(params[:id])
end

def require_authorized_for_current_piece
  return unless current_piece.game.user != current_user

  render plain: 'unauthorized', status: :unauthorized
end
end
