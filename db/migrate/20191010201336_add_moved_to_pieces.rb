class AddMovedToPieces < ActiveRecord::Migration[5.2]
  def change
  	add_column :pieces, :moved, :boolean, default:false
  end
end
