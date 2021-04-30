class PreReservation < ApplicationRecord
  has_one :inboxes
  has_many :users, :through => :inboxes
  belongs_to :lodge
end
