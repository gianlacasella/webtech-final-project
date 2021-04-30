class AddCountryForeignKeyToCity < ActiveRecord::Migration[6.1]
  def change
    add_reference :cities, :country, foreign_key:true
  end
end
