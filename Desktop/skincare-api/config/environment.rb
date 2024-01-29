# frozen_string_literal: true

# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Start providers defined in config/system/boot/*.rb
# MyApp::Container.finalize!
