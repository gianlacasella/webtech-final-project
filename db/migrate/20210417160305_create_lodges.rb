class CreateLodges < ActiveRecord::Migration[6.1]
  def change
    create_table :lodges do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.integer :number_of_beds
      t.integer :number_of_bathrooms
      t.integer :number_of_rooms
      t.boolean :gym
      t.boolean :pool
      t.boolean :jacuzzi
      t.string :conditions
      t.string :description
      t.boolean :kitchen
      t.boolean :air_conditioner
      t.boolean :warm_water
      t.boolean :shampoo
      t.integer :parking_slots
      t.boolean :bed_sheet
      t.boolean :clothespin
      t.boolean :heating
      t.string :video_directory
      t.string :photo_directory
      t.boolean :work_zone
      t.boolean :wifi
      t.integer :tv
      t.boolean :smoke_detector
      t.boolean :first_aid_kit
      t.boolean :refrigerator
      t.boolean :microwave
      t.time :check_in
      t.time :check_out
      t.boolean :smoking_allowed
      t.boolean :parties_allowed
      t.boolean :pets_allowed
      t.boolean :kids_allowed
      t.integer :people_allowed
      t.float :arrival_experience_score
      t.float :host_reliability_score
      t.float :location_score
      t.float :cleaning_score
      t.float :price_score
      t.float :host_comunication_score

      t.timestamps
    end
  end
end
