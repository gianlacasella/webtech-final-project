class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.float :host_score
      t.float :guest_score
      t.datetime :last_access
      t.datetime :registration_date
      t.string :email
      t.date :birthday
      t.string :first_name
      t.string :last_name
      t.string :profile_picture
      t.string :biography
      t.string :password

      t.timestamps
    end
  end
end
