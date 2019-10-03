class IndexPiecesTable < ActiveRecord::Migration[5.2]
  def change
    add_index(:pieces, :player_id, name: 'index_pieces_on_player_id', unique:false)
    add_index(:pieces, :game_id, name: 'index_pieces_on_game_id', unique:false)
  end
end
