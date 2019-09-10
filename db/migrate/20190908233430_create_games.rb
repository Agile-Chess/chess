# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games, force: true do |t|
      t.string :name
      t.integer :black_player_id
      t.integer :white_player_id
      t.timestamps
    end
  end
end
