class Identifier < ApplicationRecord
  self.inheritance_column = nil

  has_many :ingredient_identifiers
  has_many :ingredients, through: :ingredient_identifiers
end
