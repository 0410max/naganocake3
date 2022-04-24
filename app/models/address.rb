class Address < ApplicationRecord
    belongs_to :end_user,dependent: :destroy
end
