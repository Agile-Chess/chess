<<<<<<< HEAD
class Pawn < piece


=======
class Pawn < Piece

	  def html_code(color)
  	return (color == Piece::WHITE) ? '&#9817;' : '&#9823;'
  end
>>>>>>> 5567b055dbbeff4734e2cb16d9e1ff25da3f9ace
end