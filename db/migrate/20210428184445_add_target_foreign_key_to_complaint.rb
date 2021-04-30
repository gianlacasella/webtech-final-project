class AddTargetForeignKeyToComplaint < ActiveRecord::Migration[6.1]
  def change
    add_reference :complaints, :target, foreign_key: {to_table: :users}
  end
end
