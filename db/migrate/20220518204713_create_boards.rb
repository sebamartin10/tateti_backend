class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :player1Symbol
      t.string :player2Symbol
      t.string :turnOf
      t.boolean :active

      t.timestamps
    end
  end
end
