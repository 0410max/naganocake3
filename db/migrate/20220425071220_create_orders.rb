class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.string :ship_code
      t.string :ship_address
      t.string :ship_name
      t.integer :pay_way
      t.integer :status,default:0
      t.integer :total_money
      t.integer :send_cost

      t.timestamps
    end
  end
end
