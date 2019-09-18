class StaticPagesController < ApplicationController

def index
  @games = Game.where(black_player_id: nil).or(Game.where(white_player_id: nil))
end

end
