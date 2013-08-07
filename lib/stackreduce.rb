require 'active_support'
require 'active_support/configurable'
require 'active_support/inflector'

module Stackreduce
  extend ActiveSupport::Autoload
  
  # Use ActiveSupport::Autoload for better performance 
  # autoload all required classes
  autoload :Version
  autoload :Exceptions
  autoload :Stack
  autoload :Seed
  
  # User from rails initializer
  # ==== Examples
  # Stackreduce.configure do |config|
  #   config.token = "my_very_big_token"
  #   config.app_id = "my_applications_id"
  # end
  def self.configure
    yield self
  end

  # Applications token 
  # find in applications settings. 
  # we use it for saving the stack
  # ==== Examples
  # Stackreduce.token
  include ActiveSupport::Configurable
  config_accessor :app_id, :token

    # Parses the given array to json
  # ==== Arguments
  # * +data+ - Array
  # ==== Examples
  # Stackreduce.parse Client.includes(:address).limit(10)
  # Stackreduce.parse User.all
  def self.parse(data)
    Stackreduce::Stack.parse(data)
  end
  
  # Main api call method
  # ==== Arguments
  # * +data+ - Array
  # ==== Examples
  # Stackreduce.push Client.includes(:address).limit(10)
  # Stackreduce.push User.all
  # Stackreduce.push User.all, :stack => "My awesome stack"
  def self.push(data=nil, options = {})
    Stackreduce::Stack.push(data, options)
  end
  

  # Seeding demo stacks
  # ==== Arguments
  # * +:users+ - String
  # * +:products+ - String  
  # ==== Examples
  # Stackreduce.seed
  # Stackreduce.seed :users => "My Users Stack"
  # Stackreduce.seed :products => "My Products Stack"
  def self.seed(options = {})
    Stackreduce::Seed.seed(options)
  end
  
end