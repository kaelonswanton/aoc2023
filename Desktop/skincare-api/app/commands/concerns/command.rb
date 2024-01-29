# frozen_string_literal: true

require "dry/matcher/result_matcher"

module Command
  extend ActiveSupport::Concern

  included do
    include Dry::Monads[:result]
    include Dry::Monads::Do.for(:call)
    include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)
    include ActionView::Helpers::TranslationHelper
  end

  class_methods do
    def call(...)
      new.call(...)
    end
  end
end
