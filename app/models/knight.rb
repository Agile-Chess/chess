class Knight < Piece

	

def valid_move?(new_x_coord, new_y_coord)
    x_position = x_position(new_x_coord)
    y_position = y_position(new_y_coord)

    (x_position == 1 && y_position == 2) || (x_position == 2 && y_position == 1)
  end

end

