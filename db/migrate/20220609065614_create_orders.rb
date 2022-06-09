class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :postal_code
      t.string :name
      t.string :address
      t.integer :status, null: false, default: 0
      t.integer :postage
      t.integer :total_payment
      t.integer :payment_method, null: false, default: 0

      t.timestamps
    end
  end
end
