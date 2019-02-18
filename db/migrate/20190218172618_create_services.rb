class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.text :menu
      t.integer :price
      t.integer :max_quantity
      t.string :picture
      t.string :category
      t.date :date
      t.string :shift
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
