class IndexGamesTable < ActiveRecord::Migration[5.2]
  def change
    add_index(:games, :black_player_id, name: 'index_pieces_on_black_player_id')
    add_index(:games, :white_player_id, name: 'index_pieces_on_white_player_id')
    add_index(:games, [:black_player_id, :white_player_id], unique: true, name: 'index_pieces_on_black_and_white_player_id')
  end
end
