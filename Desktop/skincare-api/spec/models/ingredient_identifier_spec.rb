require "rails_helper"

RSpec.describe IngredientIdentifier do
  describe "associations" do
    it { should belong_to(:ingredient) }
    it { should belong_to(:identifier) }
  end
end
