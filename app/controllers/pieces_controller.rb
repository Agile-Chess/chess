class PiecesController < ApplicationController


def show
  @piece = Piece.find(params[:id])
  @game = @piece.game
  render "games/show"
end

def update
    @piece = Piece.find(params[:id])
    @game = @piece.game

    @piece.update_attributes(piece_params)
  end

  private

  def piece_params
    params.require(:piece).permit(
      :x_position,
      :y_position,
      )
  end
end