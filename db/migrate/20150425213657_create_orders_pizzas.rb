class CreateOrdersPizzas < ActiveRecord::Migration
  def change
    create_table :orders_pizzas do |t|
      t.references :order, index: true, null: false
      t.references :pizza, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :orders_pizzas, :orders
    add_foreign_key :orders_pizzas, :pizzas
  end
end
