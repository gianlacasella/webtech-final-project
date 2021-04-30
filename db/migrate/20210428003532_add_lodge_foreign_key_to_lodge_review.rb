class AddLodgeForeignKeyToLodgeReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :lodge_reviews, :lodge, foreign_key:true
  end
end
