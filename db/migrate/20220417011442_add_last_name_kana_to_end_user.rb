class AddLastNameKanaToEndUser < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :last_name_kana, :string
  end
end
