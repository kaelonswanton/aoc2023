# frozen_string_literal: true

require "selenium/webdriver"
require "capybara/rails"
require "capybara/rspec"

# Make server listening on all hosts
#
# rubocop:disable Style/IpAddresses
Capybara.server_host = "0.0.0.0"
# rubocop:enable Style/IpAddresses

Capybara.app_host = "http://0.0.0.0"

Capybara.server = :puma, { Silent: true }

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.headless!
  options.add_argument "--window-size=1680,1050"

  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 options:
end

Capybara.javascript_driver = :headless_chrome

# Don't wait too long in `have_xyz` matchers
Capybara.default_max_wait_time = 2

# Normalizes whitespaces when using `has_text?` and similar matchers
Capybara.default_normalize_ws = true

# Where to store artifacts (e.g. screenshots, downloaded files, etc.)
Capybara.save_path = File.expand_path(ENV.fetch("CAPYBARA_ARTIFACTS", "./tmp/capybara"))

RSpec.configure do |config|
  config.include Capybara::RSpecMatchers, type: %i[component system]
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, :js, type: :system) do
    driven_by Capybara.javascript_driver
  end
end
