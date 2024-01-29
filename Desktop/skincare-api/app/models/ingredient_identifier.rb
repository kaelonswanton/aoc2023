class IngredientIdentifier < ApplicationRecord
  belongs_to :ingredient
  belongs_to :identifier
end
