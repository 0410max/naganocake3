class AddEndUserIdToCartItem < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :end_user_id, :integer
  end
end
