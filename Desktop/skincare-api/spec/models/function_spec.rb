require "rails_helper"

RSpec.describe Function do
  describe "associations" do
    it { should have_many(:ingredient_functions) }
    it { should have_many(:ingredients).through(:ingredient_functions) }
  end
end
