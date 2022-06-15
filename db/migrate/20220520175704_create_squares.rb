class CreateSquares < ActiveRecord::Migration[7.0]
  def change
    create_table :squares do |t|
      t.integer :index
      t.string :symbol

      t.timestamps
    end
  end
end
