class CreateLodgeReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :lodge_reviews do |t|
      t.string :description
      t.datetime :date
      t.string :title
      t.float :arrival_experience
      t.float :price_score
      t.float :communication_score
      t.float :cleaning_score
      t.float :location_score
      t.float :host_reliability

      t.timestamps
    end
  end
end
