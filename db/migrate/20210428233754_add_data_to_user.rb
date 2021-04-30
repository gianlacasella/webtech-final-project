class AddDataToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :is_admin, :boolean
    add_column :users, :is_host, :boolean
  end
end
