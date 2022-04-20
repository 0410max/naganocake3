class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.integer :notax_price
      t.text :introduction
      t.boolean :is_sale

      t.timestamps
    end
  end
end
