class BoardsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def show
        @board = Board.find(params[:id])
        render status:200,json:{board:@board}
    end
    def getSquares
        
        if !Board.exists?(params[:id])
            render status: 404,json:{message:"It doesnt exist a game with the ID provided."}
        else
            @board = Board.find(params[:id])
            @squares = @board.squares.sort_by{|e| e[:index]}
            render status:200,json:{squares:@squares}
        end
        
    end
    def create
        @board = Board.new(board_params)
        if(@board.save)
            render status:200,json:{board:@board}
        else
            render status:400,json:{message:@board.error.details}
        end
    end
    def update
        @board = Board.find(params[:id])
            if @board.update(board_params)
                render status:200,json:{board:@board}
            else
                render status:400,json:{message:@board.error.details}
            end
    end
    private 
        def board_params
            params.require(:board).permit(:player1Symbol,:player2Symbol,:turnOf,:active,:square)
        end
end
