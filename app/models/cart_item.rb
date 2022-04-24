class CartItem < ApplicationRecord
    belongs_to :end_user,dependent: :destroy
    belongs_to :item,dependent: :destroy
end
