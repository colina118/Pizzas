class CreateIngridientsPizzas < ActiveRecord::Migration
  def change
    create_table :ingridients_pizzas do |t|
      t.references :pizza, index: true, null: false
      t.references :ingridient, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :ingridients_pizzas, :pizzas
    add_foreign_key :ingridients_pizzas, :ingridients
  end
end
