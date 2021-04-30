class CreateComplaints < ActiveRecord::Migration[6.1]
  def change
    create_table :complaints do |t|
      t.datetime :date
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
