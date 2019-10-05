# frozen_string_literal: true

# Pieces controller to manage activities
class PiecesController < ApplicationController
  before_action :find_piece, :verify_two_players, :verify_player_turn,
                :verify_valid_move
  before_action :require_authorized_for_current_piece, only: [:update]

  def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
    render 'games/show'
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game

    if !your_turn?
      render text: 'It must be your turn',
             status: :unauthorized
    else
      @piece.attempt_move(piece_params)
      @piece.save
      redirect_to game_path @game
    end
    current_piece.update_attributes(piece_params)
    render plain: 'updated!'
  end

  def find_piece
    @piece = Piece.find(params[:id])
    @game = @piece.game
  end

  private

  def piece_params
    @piece_params = params.require(:piece).permit(
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
