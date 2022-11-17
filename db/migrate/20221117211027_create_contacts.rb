class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
	  create_table :contacts, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :company_name, null: false
      t.text :company_background
      t.text :company_address, null: false
      t.string :phone, null: false
      t.string :facebook, default: ""
      t.string :twitter, default: ""
      t.string :linkedin, default: ""

      t.timestamps
    end
  end
end
