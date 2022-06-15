class AddBoardToSquares < ActiveRecord::Migration[7.0]
  def change
    add_reference :squares, :board, null: false, foreign_key: true
  end
end
