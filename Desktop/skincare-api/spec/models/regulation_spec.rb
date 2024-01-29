require "rails_helper"

RSpec.describe Regulation do
  describe "associations" do
    it { should have_many(:ingredient_regulations) }
    it { should have_many(:ingredients).through(:ingredient_regulations) }
  end
end
