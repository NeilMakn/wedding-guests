class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :name
      t.string :lastname
      t.integer :partysize

      t.timestamps
    end
  end
end
