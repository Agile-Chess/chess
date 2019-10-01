<<<<<<< HEAD
class PiecesController < ApplicationController
end
=======
class PiecesController < ApplicationController
	before_action :find_piece,:verify_two_players, :verify_player_turn, :verify_valid_move
	
	def update
		
	end
end
>>>>>>> 5567b055dbbeff4734e2cb16d9e1ff25da3f9ace
