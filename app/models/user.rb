class User < ApplicationRecord
  has_many :lodge_reviews , dependent: :destroy
  has_and_belongs_to_many :languages
  has_one :city
  has_many :phone_numbers, dependent: :destroy
  has_and_belongs_to_many :guest_reviews, dependent: :destroy
  has_and_belongs_to_many :complaints , dependent: :destroy
  has_many :inboxes, dependent: :destroy
  has_many :preservations, :through => :inboxes, dependent: :destroy
  has_many :lodges, dependent: :destroy
  validates :email, uniqueness: true, email: true
end
