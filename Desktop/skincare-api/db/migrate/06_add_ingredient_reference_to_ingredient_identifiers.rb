class AddIngredientReferenceToIngredientIdentifiers < ActiveRecord::Migration[7.1]
  def change
    add_reference :ingredient_identifiers, :ingredient, foreign_key: true
  end
end
