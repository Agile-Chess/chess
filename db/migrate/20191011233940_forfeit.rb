class Forfeit < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :winning_player_id, :integer
  end
end
