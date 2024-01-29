require "rails_helper"

RSpec.describe Account do
  describe "associations" do
    it { should have_many(:api_keys) }
  end
end
