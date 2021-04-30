class LodgeReview < ApplicationRecord
  belongs_to :user
  belongs_to :lodge
end
