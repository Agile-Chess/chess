class PiecesController < ApplicationController
	before_action :find_piece,:verify_two_players, :verify_player_turn, :verify_valid_move
	
	def update
		@game = @piece.game
	end
end
