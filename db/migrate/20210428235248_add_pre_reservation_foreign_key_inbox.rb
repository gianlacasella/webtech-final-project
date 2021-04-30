class AddPreReservationForeignKeyInbox < ActiveRecord::Migration[6.1]
  def change
    add_reference :inboxes, :pre_reservation, foreign_key: true
  end
end
