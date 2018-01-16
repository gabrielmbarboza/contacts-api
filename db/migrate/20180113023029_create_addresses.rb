class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.city :string
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end