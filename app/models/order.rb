class Order < ApplicationRecord
    enum pay_way: { credit_card: 0, transfer: 1 }
    belongs_to :current_end_user
end
