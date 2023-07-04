gem 'talisman'

require 'talisman'

Talisman.configure do |config|
  config.content_security_policy do |csp|
    csp.default_src :self
    csp.script_src :self, :https
    csp.style_src :self, :https
    csp.font_src :self, :data
    csp.img_src :self, :data
    csp.object_src :none
    csp.upgrade_insecure_requests
  end

  config.http_strict_transport_security = { max_age: 31536000 }
  config.x_content_type_options = 'nosniff'
  config.x_xss_protection = { mode: 'block' }
  config.x_frame_options = 'SAMEORIGIN'
end

require_relative 'initializers/talisman'
require 'talisman'

Talisman::Hooks::PreCommit.new.hook
