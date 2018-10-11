class AddInvitationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :invitation_id, :integer
    add_column :users, :recipient_email, :string
  end
end
