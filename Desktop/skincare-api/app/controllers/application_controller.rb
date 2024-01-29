# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protected

  def run(command, command_params, &block)
    resolve(command).call(command_params, &block)
  end
end
