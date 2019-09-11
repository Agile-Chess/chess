class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces, :force => true do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :x_position
      t.integer :y_position
      t.string :piece_type
      t.timestamps
    end
  end
end
