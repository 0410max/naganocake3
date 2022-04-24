class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items,dependent: :destroy
    has_one_attached :image
    validates :image,presence:true
    validates :name,presence:true
    validates :introduction,presence:true
    validates :notax_money,presence:true
end