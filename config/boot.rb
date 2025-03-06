# config/boot.rb

ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'rubygems'
require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'logger'  # ensure Ruby's Logger is loaded

# Patch ActiveSupport to define LoggerThreadSafeLevel::Logger early
module ActiveSupport
  module LoggerThreadSafeLevel
    Logger = ::Logger unless const_defined?(:Logger)
  end
end

# Continue with the rest of boot.rb...
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
