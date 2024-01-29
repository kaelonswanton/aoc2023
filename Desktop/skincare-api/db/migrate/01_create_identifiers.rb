class CreateIdentifiers < ActiveRecord::Migration[7.1]
  def change
    create_table :identifiers do |t|
      t.string :type
      t.string :value
      t.index :value

      t.timestamps
    end
  end
end
