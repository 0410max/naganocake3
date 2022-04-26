class Order < ApplicationRecord
    enum pay_way: { credit_card: 0, transfer: 1 }
end
