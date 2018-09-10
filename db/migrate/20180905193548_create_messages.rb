class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :administrator, foreign_key: false
      t.references :enduser, foreign_key: false

      t.timestamps
    end
    add_foreign_key :messages, :administrator, column: :enduser_id
    add_foreign_key :messages, :enduser, column: :administrator_id
  end
end
