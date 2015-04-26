class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null:false
      t.string :lastname, null:false
      t.string :phone_number, null:false
      t.text :address, null:false

      t.timestamps null: false
    end
  end
end
