class PlayersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @players = Player.all
        render json:@players
    end

    def show
        @player = Player.find(params[:id])
        render json:@player
    end
    
    def create
        @player = Player.new(player_params)
      
        if @player.save
            render status:200,json:{player:@player}
        else
            render status:400,json:{message:@player.error.details}
        end
        
    end

    
    private 
        def player_params
            params.require(:player).permit(:name)
        end

    
end
