class AddUserForeignKeyToGuestReview < ActiveRecord::Migration[6.1]
  def change
    add_reference :guest_reviews, :user, foreign_key: {to_table: :users}
  end
end
