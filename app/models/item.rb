class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items,dependent: :destroy
    has_many :order_details,dependent: :destroy
    has_one_attached :image
    validates :name,presence:true
    validates :introduction,presence:true
    validates :notax_money,presence:true
    def with_tax_price
        (notax_money * 1.1).floor
    end
    
end
