class Ingredient < ApplicationRecord
  has_many :ingredient_identifiers
  has_many :identifiers, through: :ingredient_identifiers
  has_many :ingredient_regulations
  has_many :regulations, through: :ingredient_regulations
  has_many :ingredient_functions
  has_many :functions, through: :ingredient_functions
  
end
