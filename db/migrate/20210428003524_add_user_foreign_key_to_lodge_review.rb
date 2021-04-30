class AddUserForeignKeyToLodgeReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :lodge_reviews, :user, foreign_key:true
  end
end
