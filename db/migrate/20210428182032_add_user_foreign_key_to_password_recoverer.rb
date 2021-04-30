class AddUserForeignKeyToPasswordRecoverer < ActiveRecord::Migration[6.1]
  def change
    add_reference :password_recoverers, :user, foreign_key:true
  end
end
