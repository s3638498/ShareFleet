class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :sender_id
      t.string :recipient_email

      t.timestamps
    end
  end
end
