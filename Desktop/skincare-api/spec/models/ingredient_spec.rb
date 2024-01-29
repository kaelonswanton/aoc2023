require "rails_helper"

RSpec.describe Ingredient do
  describe "associations" do
    it { should have_many(:ingredient_identifiers) } 
    it { should have_many(:identifiers).through(:ingredient_identifiers) }
    it { should have_many(:ingredient_regulations) }
    it { should have_many(:regulations).through(:ingredient_regulations) }
    it { should have_many(:ingredient_functions) } 
    it { should have_many(:functions).through(:ingredient_functions) }
  end
end
