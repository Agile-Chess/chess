class Knight < Piece

	

def valid_move?(x_des, y_des)
    x_distance = (x_distance - x_des).abs
    y_distance = (y_distance - y_des).abs
byebug
    (x_distance == 1 && y_distance == 2) || (x_distance == 2 && y_distance == 1)
  end

end

