class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.text :name
      t.float :price, null: false

      t.timestamps null: false
    end
  end
end
