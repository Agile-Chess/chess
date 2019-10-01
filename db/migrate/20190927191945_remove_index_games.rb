class RemoveIndexGames < ActiveRecord::Migration[5.2]
  def change

  	remove_index(:games, [:black_player_id])
    remove_index(:games, [:white_player_id])
    remove_index(:games, [:black_player_id, :white_player_id])
  end
end
