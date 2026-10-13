if ENV['COV'] == '1'
  require 'simplecov'
  SimpleCov.start
end

require 'ostruct'
require_relative '../lib/tumblr_client'

RSpec.configure do |config|
  # Place this line at the top
  config.raise_errors_for_deprecations!
end