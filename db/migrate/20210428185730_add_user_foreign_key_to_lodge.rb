class AddUserForeignKeyToLodge < ActiveRecord::Migration[6.1]
  def change
    add_reference :lodges, :user, foreign_key: true
  end
end
