class CreatePasswordRecoverers < ActiveRecord::Migration[6.1]
  def change
    create_table :password_recoverers do |t|
      t.boolean :email_sent
      t.string :key

      t.timestamps
    end
  end
end
