require 'rails_helper'

RSpec.describe Game, type: :model do

    describe "creating pieces" do
        let!(:player1) {User.create(:email => 'None@example.com',:password => "None12")}
        let!(:player2) {User.create(:email => 'None1@example.com',:password => "None12")}
        let!(:game) {Game.create(:name => 'New Game', :white_player_id => player1.id, :black_player_id => player2.id)}

        it "create pieces" do
            expect(Game.last.pieces.count).to eq(32)
        end
    end

    describe "#populate_game" do
        pending
    end
end