class Inbox < ApplicationRecord
  has_one :user
  has_one :pre_reservation
end
