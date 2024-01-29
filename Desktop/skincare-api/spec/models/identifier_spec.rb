require "rails_helper"

RSpec.describe Identifier do
  describe "assocations" do
    it { should have_many(:ingredient_identifiers) }
    it { should have_many(:ingredients).through(:ingredient_identifiers) }
  end
end
