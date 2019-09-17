<<<<<<< HEAD
class GamesController < ApplicationController

  def index
    @game = Game.all
  end

    def create
    @game = Game.create(game_params)
      redirect_to game_path(@game)
    end

    def new
      @game = Game.new
    end

    def show
      @game = Game.find(params[:id])
    end

private 
    
    def game_params
      params.require(:game).permit(:name)
    end

end
=======
class GamesController < ApplicationController

	def show
		## @game = Game.find(params[:id])

	end

end
>>>>>>> 0ce1168d22a70a51e2372aea2bd59e49de923fb8
