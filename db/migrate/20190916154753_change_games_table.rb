class ChangeGamesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :turn, :integer
    add_column :games, :state, :string
  end
end