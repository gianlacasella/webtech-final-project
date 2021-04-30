class AddConfirmedToPreReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :pre_reservations, :confirmed, :boolean
  end
end
