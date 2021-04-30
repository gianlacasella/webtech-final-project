class Lodge < ApplicationRecord
  has_many :lodge_reviews, dependent: :destroy
  belongs_to :user
  has_many :pre_reservations, dependent: :destroy
  has_one :type
  has_one :city
end
