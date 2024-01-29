require "rails_helper"

RSpec.describe IngredientFunction do
  describe "associations" do
    it { should belong_to(:ingredient) }
    it { should belong_to(:function) }
  end
end
