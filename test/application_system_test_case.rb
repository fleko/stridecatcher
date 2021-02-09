require "test_helper"
require "socket"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400], options: {
    url: ENV.fetch("SELENIUM_REMOTE_URL")
  }
  include Devise::Test::IntegrationHelpers
end
