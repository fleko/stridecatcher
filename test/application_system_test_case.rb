require "test_helper"
require "socket"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV["SELENIUM_REMOTE_URL"]
    driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400], options: {
      url: ENV.fetch("SELENIUM_REMOTE_URL")
    }
  else
    driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400]
  end

  include Devise::Test::IntegrationHelpers
end
