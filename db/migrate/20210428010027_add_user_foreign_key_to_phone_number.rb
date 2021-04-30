class AddUserForeignKeyToPhoneNumber < ActiveRecord::Migration[6.1]
  def change
    add_reference :phone_numbers, :user, foreign_key:true
  end
end
