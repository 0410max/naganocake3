class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items,dependent: :destroy
  has_many :addresses,dependent: :destroy

  validates :first_name,presence:true
  validates :last_name,presence:true
  validates :first_name_kana,presence:true
  validates :first_name_kana,presence:true
  validates :address,presence:true
  validates :postcode,presence:true
  validates :phone_number,presence:true
end
