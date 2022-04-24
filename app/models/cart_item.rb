class CartItem < ApplicationRecord
    belongs_to :end_user
    belongs_to :item
    validates :amount,presence:true
    def subtotal
        item.with_tax_price * amount.to_i
    end
end
