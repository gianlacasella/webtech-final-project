class AddDataToLodge < ActiveRecord::Migration[6.1]
  def change
    add_column :lodges, :x_cord, :float
    add_column :lodges, :y_cord, :float
  end
end
