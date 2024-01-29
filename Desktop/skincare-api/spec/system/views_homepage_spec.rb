# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User views homepage" do
  it "loads the homepage successfully" do
    visit root_path

    expect(page).to have_content "Hello world"
  end
end
