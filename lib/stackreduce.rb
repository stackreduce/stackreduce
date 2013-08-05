require "stackreduce/version"
require "stackreduce/config"
require "stackreduce/exceptions"
require 'active_support'
require 'json'
require 'net/http'
 
module Stackreduce
  class Stack
    STACKREDUCE_API_URL = "http://localhost:3000/api/v1/apps/#{Stackreduce.config.app_id}/create_stack.json"
    
    class StackreduceException < Exception
    end
    
    def self.config_is_valid?
      !(Stackreduce.config.token.nil? or Stackreduce.config.app_id.nil?)
    end
    
    def self.validate_config!
      Stackreduce.exception("Config is not valid: #{Stackreduce.config.inspect}") unless config_is_valid?
    end

    # Examples:
    # Stackreduce::Stack.parse Client.includes(:address).limit(10)
    # Stackreduce::Stack.parse User.all
    # params: array
    def self.parse(array)
      
      # TODO force to be array
      # when User.last  returns a hash
      
      data = nil
      begin
      data =  ActiveSupport::JSON.encode(array)
      rescue ActiveSupport::JSON.parse_error
        Stackreduce.exception ActiveSupport::JSON.parse_error
      end
      data
    end
    
    def self.push(data)
      validate_config!      
      parse(data)
        
      uri = URI(STACKREDUCE_API_URL)
      res = Net::HTTP.post_form(uri, 'token' => Stackreduce.config.token, 'app' => Stackreduce.config.app_id, 'stack_data' => data)
      handle_response res
    end
    
    def self.handle_response res
      res.code == "200" ? ActiveSupport::JSON.decode(res.body) : Stackreduce.exception("Response: #{res.inspect}") 
    end
    
  end
end
