require "rails_helper"

RSpec.describe IngredientRegulation do
  describe "assocations" do
    it { should belong_to(:ingredient) }
    it { should belong_to(:regulation) }
  end
end
