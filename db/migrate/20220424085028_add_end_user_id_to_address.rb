class AddEndUserIdToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :end_user_id, :integer
  end
end
