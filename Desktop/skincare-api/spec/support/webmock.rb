# frozen_string_literal: true

require "webmock/rspec"

WebMock.disable_net_connect!(
  # NOTE: The webdrivers gem looks for updates to our driver(s) automatically
  # when we run our specs so we need to allow calls to the driver hosts. For
  # now we only need the chromedriver:
  allow: /(__identify__|shutdown|session|chromedriver.storage.googleapis.com)/,
  # NOTE: System tests break if we don't allow localhost:
  allow_localhost: true
)
