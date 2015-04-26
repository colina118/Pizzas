class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :user, null: false
      t.references :branch, index: true, null: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end
    add_foreign_key :employees, :branches
  end
end
