class CreateIngridients < ActiveRecord::Migration
  def change
    create_table :ingridients do |t|
      t.text :name, null: false
      t.float :price, null: false

      t.timestamps null: false
    end
  end
end
