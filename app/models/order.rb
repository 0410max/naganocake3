class Order < ApplicationRecord
    enum pay_way: { credit_card: 0, transfer: 1 }
    enum status: { payment_waiting: 0, confirm: 1, running: 2, shipment_waiting: 3, executed: 4 }
    belongs_to :end_user
    has_many :order_details,dependent: :destroy
end
