require 'active_support'
require 'active_support/configurable'

module Stackreduce
  # Configures global settings for Stackreduce
  #   Stackreduce.configure do |config|
  #     config.token = ""
  #   end
  def self.configure(&block)
    yield @config ||= Stackreduce::Configuration.new
  end

  # Global settings for Stackreduce
  def self.config
    @config
  end

  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :token
    config_accessor :app_id

  end

  configure do |config|
    config.token = nil
    config.app_id = nil
  end
end
