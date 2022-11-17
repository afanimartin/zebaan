class AddUserToContacts < ActiveRecord::Migration[7.0]
  def change
    add_reference :contacts, :user, type: :uuid, null: false, foreign_key: true
  end
end
