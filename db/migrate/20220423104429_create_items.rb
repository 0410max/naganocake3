class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name
      t.integer :genre_id
      t.text :introduction
      t.integer :notax_money
      t.boolean :is_sale

      t.timestamps
    end
  end
end
