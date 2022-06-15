class SquaresController < ApplicationController
    skip_before_action :verify_authenticity_token
    def show
        @square = Square.find(params[:id])
        render status:200,json:{board:@square}
    end
    def update
        @square = Square.find(params[:id])
            if @square.update(square_params)
                render status:200,json:{square:@square}
            else
                render status:400,json:{message:@square.error.details}
            end
    end
    def create
        @square = Square.new(square_params)
        if(@square.save)
            render status:200,json:{square:@square}
        else
            render status:400,json:{message:@square.error.details}
        end
    end
    private 
        def square_params
            params.require(:square).permit(:index,:symbol,:board_id)
        end
end
