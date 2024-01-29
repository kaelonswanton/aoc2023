class Regulation < ApplicationRecord
  has_many :ingredient_regulations
  has_many :ingredients, through: :ingredient_regulations
end
