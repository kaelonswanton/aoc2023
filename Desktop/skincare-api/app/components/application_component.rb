# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  include HeroiconHelper
  include ApplicationHelper
  include ComponentHelper

  extend Dry::Initializer

  strip_trailing_whitespace

  # Returns an identifier for data-controller names.
  # E.g. Table::Component stimulus controller becomes ui--table-controller
  def identifier
    self.class
      .name
      .sub("::Component", "")
      .underscore
      .split("/")
      .join("--")
  end

  def controller_target(selector)
    "data-#{identifier}-target=#{selector}"
  end

  def controller_action(type, method)
    "data-action=#{type}->#{identifier}##{method}"
  end

  # Used for cases you want to do something different if passed a string from
  # .with_content
  def using_with_content?
    defined?(@__vc_content_set_by_with_content)
  end
end
