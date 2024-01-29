# frozen_string_literal: true

if Rails.env.production? && defined?(SecureHeaders)
  # See: https://github.com/twitter/secureheaders
  SecureHeaders::Configuration.default
end

# Or create your own for development and production...
#
# SecureHeaders::Configuration.default do |config|
#   config.csp = config.csp.merge(
#     media_src: [
#       "data:"
#     ]
#   )

#   if Rails.env.development?
#     config.csp = config.csp.merge(
#       script_src: config.csp[:script_src] + [
#         "http://localhost:3000"
#       ],
#       connect_src: config.csp[:connect_src] + [
#         "http://#{ViteRuby.config.host_with_port}/vite-dev/",
#         "ws://#{ViteRuby.config.host_with_port}"
#       ]
#     )
#   end
# end
