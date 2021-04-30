class CreateInboxes < ActiveRecord::Migration[6.1]
  def change
    create_table :inboxes do |t|
      t.string :text_user
      t.string :text_host

      t.timestamps
    end
  end
end
