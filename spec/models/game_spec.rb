require 'rails_helper'

RSpec.describe Game, type: :model do

    describe "#populate_game" do
        it "should load all the pawns on the board" do
            game = Game.create
            white_pawn = (0..7).each do |i|
              FactoryBot.create :pawn,
              game_id: game.id,
              x_position: i,
              y_position: 1,
              player_id: 1,
              color: Piece::WHITE    
          end
          black_pawn = (0..7).each do |i|
              FactoryBot.create :pawn,
              game_id: game.id,
              x_position: i,
              y_position: 6,
              player_id: 2,
              color: Piece::BLACK   
          end

          pawn_count = Pawn.count
        expect(pawn_count).to eq(16)
    end

    it "should load all the rooks on the board" do 
        game = Game.create
          white_rook = [0,7].each do |i|
            FactoryBot.create :rook,
            game_id: game.id,
            x_position: i,
            y_position: 0,
            player_id: 1,
            color: Piece::WHITE    
        end
        black_rook = [0,7].each do |i|
            FactoryBot.create :rook,
            game_id: game.id,
            x_position: i,
            y_position: 7,
            player_id: 2,
            color: Piece::BLACK
        end

        rook_count = Rook.count
expect(rook_count).to eq(4)

    end

    it "should expect to load all the knights on the board" do 
        game = Game.create
        white_knight = [1,6].each do |i| 
          FactoryBot.create :knight, 
          game_id: game.id,
          x_position: i,
          y_position: 0,
          player_id: 1,
          color: Piece::WHITE 
      end
      black_knight = [1,6].each do |i|
          FactoryBot.create :knight,
          game_id: game.id,
          x_position: i,
          y_position: 7,
          player_id: 2,
          color: Piece::BLACK   
      end
      knight_count = Knight.count
expect(knight_count).to eq(4)

  end

  it "should expect to load all the bishops on the board" do 
    game = Game.create
      white_bishop = [2,5].each do |i|
        FactoryBot.create :bishop,
        game_id: game.id,
        x_position: i,
        y_position: 0,
        player_id: 1,
        color: Piece::WHITE  
    end
    black_bishop = [2,5].each do |i|
        FactoryBot.create :bishop, 
        game_id: game.id,
        x_position: i,
        y_position: 0,
        player_id: 2,
        color: Piece::BLACK 
    end 
    bishop_count = Bishop.count
    
expect(bishop_count).to eq(4)
end

it "should expect to load the queens on the board" do 
game  = Game.create
    white_queen = FactoryBot.create :queen,
    game_id: game.id,
    x_position: 3,
    y_position: 0,
    player_id: 1,
    color: Piece::WHITE

    black_queen = FactoryBot.create :queen, 
    game_id: game.id,
    x_position: 3,
    y_position: 7,
    player_id: 2,
    color: Piece::BLACK
    queen_count = Queen.count
expect(queen_count).to eq(2)

end

it "should expect to load the kings on the board" do
game = Game.create

    white_king = FactoryBot.create :king, 
    game_id: game.id,
    x_position: 4,
    y_position: 0,
    player_id: 1,
    color: Piece::WHITE 

    black_king = FactoryBot.create :king, 
    game_id: game.id,
    x_position: 4,
    y_position: 7,
    player_id: 2,
    color: Piece::BLACK
    
    king_count = King.count
    expect(king_count).to eq(2)
    end

end
end


######
    #describe "creating pieces" do
      #  let!(:player1) {User.create(:email => 'None@example.com',:password => "None12")}
       # let!(:player2) {User.create(:email => 'None1@example.com',:password => "None12")}
       # let!(:game) {Game.create(:name => 'New Game', :white_player_id => player1.id, :black_player_id => player2.id)}

       # it "create pieces" do
        #    expect(Game.last.pieces.count).to eq(32)


       # describe "#populate_game" do
        #   pending
       # end
   # end