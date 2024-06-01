class CreateMatchInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :match_invites do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :status
      t.date :match_date

      t.timestamps
    end
  end
end
