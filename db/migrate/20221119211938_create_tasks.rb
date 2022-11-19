class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
	  create_table :tasks, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :content, null: false
      t.text :description, default: ""
      t.boolean :is_complete, null: false, default: false
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
