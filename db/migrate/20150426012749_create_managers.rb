class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.references :employee, index: true, null: false
      t.string :shift, null: false

      t.timestamps null: false
    end
    add_foreign_key :managers, :employees
  end
end
