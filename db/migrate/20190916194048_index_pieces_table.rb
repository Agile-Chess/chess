class IndexPiecesTable < ActiveRecord::Migration[5.2]
  def change
    add_index(:pieces, :player_id, name: 'index_pieces_on_player_id')
    add_index(:pieces, :game_id, name: 'index_pieces_on_game_id')
    add_index(:pieces, [:player_id, :game_id], unique: true, name: 'index_pieces_on_player_id_and_game_id')
  end
end
