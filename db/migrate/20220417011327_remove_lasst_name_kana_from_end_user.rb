class RemoveLasstNameKanaFromEndUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :end_users, :lasst_name, :string
  end
end
