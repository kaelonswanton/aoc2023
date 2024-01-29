# frozen_string_literal: true

module ComponentHelper
  # Allows for rendering of components like:
  # <%= component :my_component, arg1: 'value', arg2: 'value' do %>
  #   <p>Some content</p>
  # <% end %>

  def component(*args, **, &block)
    name, *args = args
    component_klass = "#{name.to_s.camelize}::Component".constantize
    component = component_klass.new(*args, **)
    render(component, &block)
  rescue NameError => e
    raise NameError,
          "Component #{name} not found in app/components/**/*: #{e.message}"
  end
end
