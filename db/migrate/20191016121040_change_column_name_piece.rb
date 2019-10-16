class ChangeColumnNamePiece < ActiveRecord::Migration[5.2]
  def change
    rename_column :pieces, :player_id, :user_id
  end
end
