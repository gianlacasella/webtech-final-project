class AddLodgeForeignKeyToPreReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :pre_reservations, :lodge, foreign_key: true
  end
end
