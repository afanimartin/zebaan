class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :company_name
      t.text :company_background
      t.text :company_address
      t.string :phone
      t.string :facebook
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end
