class AddItemIdToGenre < ActiveRecord::Migration[6.1]
  def change
    add_column :genres, :item_id, :integer
  end
end
