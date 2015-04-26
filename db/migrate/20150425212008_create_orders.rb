class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client, index: true, null:false
      t.references :branch, index: true, null:false

      t.timestamps null: false
    end
    add_foreign_key :orders, :clients
    add_foreign_key :orders, :branches
  end
end
