class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum making_status: { no_making: 0, making_waiting: 1, running: 2, executed: 3 }
end
