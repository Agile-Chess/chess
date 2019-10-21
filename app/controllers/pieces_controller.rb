# frozen_string_literal: true

# Pieces controller to manage activities
class PiecesController < ApplicationController
  before_action :verify_your_turn?, only: [:update]
  # before_action :verify_valid_move
  # before_action :require_authorized_for_current_piece, only: [:update]

  def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @pieces = @game.pieces
    render 'games/show'
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    if verify_valid_move?
      @piece.update(piece_params)
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @piece, moved: true }
      end
    else
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @piece, moved: false }
      end
    end
    
  end

  private

  def verify_valid_move?
    x_position = params[:x_position]
    y_position = params[:y_position]
    puts x_position, y_position
    @piece = Piece.find(params[:id])
    @piece.valid_move?(x_position, y_position)
  end

  def piece_params
    params.permit(
      :id, :x_position, :y_position, :type, :color, :html_code, :user_id
    )
  end

  def current_piece
    @current_piece ||= piece.find(params[:id])
  end

  def require_authorized_for_current_piece
    return unless current_piece.game.user != current_user

    render plain: 'unauthorized', status: :unauthorized
  end

  def verify_your_turn?
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @game.turn == current_user.id
  end

end
