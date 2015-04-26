class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.text :adress, null:false
      t.integer :postal_code, null:false
      t.string :phone_number, null:false

      t.timestamps null: false
    end
  end
end
