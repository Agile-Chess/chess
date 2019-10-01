class RemoveIndexPieces < ActiveRecord::Migration[5.2]
  def change
  	remove_index(:pieces, [:game_id])
    remove_index(:pieces, [:player_id])
    remove_index(:pieces, [:player_id, :game_id])
  end
end
