class AddValueToIdentifiers < ActiveRecord::Migration[7.1]
  def change
    add_column :identifiers, :value, :string
    add_index :identifiers, :value
  end
end
