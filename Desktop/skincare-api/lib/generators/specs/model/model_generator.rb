# frozen_string_literal: true

module Specs
  class ModelGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("templates", __dir__)

    def create_spec_file
      output_file = File.join("spec/models", class_path, "#{file_name}_spec.rb")
      template "model_spec.rb.tt", output_file
    end
  end
end
