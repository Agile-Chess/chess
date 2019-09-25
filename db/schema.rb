# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_22_175151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bishops", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "black_player_id"
    t.integer "white_player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "turn"
    t.string "state"
    t.integer "winner_id"
    t.index ["black_player_id", "white_player_id"], name: "index_pieces_on_black_and_white_player_id", unique: true
    t.index ["black_player_id"], name: "index_pieces_on_black_player_id"
    t.index ["white_player_id"], name: "index_pieces_on_white_player_id"
  end

  create_table "kings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "knights", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moves", force: :cascade do |t|
    t.integer "x_coord"
    t.integer "y_coord"
    t.integer "x_end"
    t.integer "y_end"
    t.integer "move_count"
    t.boolean "captured"
    t.integer "game_id"
    t.integer "piece_id"
    t.string "piece_type"
    t.integer "piece_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pawns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.integer "x_coord"
    t.integer "y_coord"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.string "symbol"
    t.boolean "white"
    t.string "name"
    t.boolean "captured", default: false, null: false
    t.integer "move_number", default: 0
    t.integer "king_check", default: 0
    t.index ["game_id"], name: "index_pieces_on_game_id"
    t.index ["user_id", "game_id"], name: "index_pieces_on_user_id_and_game_id", unique: true
    t.index ["user_id"], name: "index_pieces_on_user_id"
  end

  create_table "queens", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
