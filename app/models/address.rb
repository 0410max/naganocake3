class Address < ApplicationRecord
    belongs_to :end_user
    validates :postcode,presence:true
    validates :address,presence:true
    validates :name,presence:true
end
