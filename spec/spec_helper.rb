require 'rspec/core'
require 'blox'

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.full_backtrace      = true
  config.verbose_retry       = true # show retry status in spec process
  
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.mock_with :none
end