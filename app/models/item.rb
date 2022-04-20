class Item < ApplicationRecord
    has_one_attached :image
    validates name,presence:true
    validates introduction,presence:true
    validates genre_id,presence:true
    validates notax_price,presence:true
    validates is_sale,presence:true
end
