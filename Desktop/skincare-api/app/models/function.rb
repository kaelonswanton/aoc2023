class Function < ApplicationRecord
  has_many :ingredient_functions
  has_many :ingredients, through: :ingredient_functions
end
