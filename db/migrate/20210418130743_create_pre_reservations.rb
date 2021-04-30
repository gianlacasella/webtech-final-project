class CreatePreReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :pre_reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :pre_reservation_date_time
      t.integer :number_of_people

      t.timestamps
    end
  end
end
