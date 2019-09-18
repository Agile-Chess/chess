class ChangePiecesTable < ActiveRecord::Migration[5.2]
  def self.down
    remove_column :pieces, :piece_type, :string
  end
  def self.up
    add_column :pieces, :type, :string
    add_column :pieces, :symbol, :string
  end
end