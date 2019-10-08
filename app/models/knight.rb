class Knight < Piece

	def html_code
    return y_position > 6 ? '&#9816;' : '&#9822;'
  end

end