class CreateGuestReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :guest_reviews do |t|
      t.string :title
      t.string :description
      t.float :score
      t.datetime :date

      t.timestamps
    end
  end
end
