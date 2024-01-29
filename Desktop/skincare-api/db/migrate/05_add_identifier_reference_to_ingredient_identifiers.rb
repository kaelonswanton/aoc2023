class AddIdentifierReferenceToIngredientIdentifiers < ActiveRecord::Migration[7.1]
  def change
    add_reference :ingredient_identifiers, :identifier, foreign_key: true
  end
end
