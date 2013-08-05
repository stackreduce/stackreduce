require 'rails'
require 'active_support'
 
module Stackreduce
  extend ActiveSupport::Autoload
  
  # Use ActiveSupport::Autoload for better performance 
  # autoload all gems classes
  autoload :Version
  autoload :Exceptions
  autoload :Stack
  
  
  # User from rails initializer
  # ==== Examples
  # Stackreduce.configure do |config|
  #   config.token = ""
  #   config.app_id = ""
  # end
  def self.configure
    yield self
  end
   
  # Applications app_id 
  # find in applications settings. 
  # we use it for saving the stack
  # ==== Examples
  # Stackreduce.app_id
  mattr_accessor :app_id
  @@app_id = nil
  
  # Applications token 
  # find in applications settings. 
  # we use it for saving the stack
  # ==== Examples
  # Stackreduce.token
  mattr_accessor :token
  @@token = nil

  
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
  def self.push(data)
    Stackreduce::Stack.push(data)
  end
end

