# frozen_string_literal: true

module ApplicationHelper
  def turbo_frame_request?
    request.headers["Turbo-Frame"].present?
  end
end
