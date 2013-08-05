require "stackreduce/version"
require "stackreduce/config"
require "stackreduce/exceptions"
require 'active_support'
require 'json'
require 'net/http'
 
module Stackreduce
  class Stack
    STACKREDUCE_API_URL = "http://localhost:3000/api/v1/apps/2/create_stack.json"
    
    class StackreduceException < Exception
    end
    
    def self.config_is_valid?
      !(Stackreduce.config.token.nil? or Stackreduce.config.app_id.nil?)
    end
    
    def self.validate_config!
      Stackreduce.exception("Config is not valid: #{Stackreduce.config.inspect}") unless config_is_valid?
    end

    def self.push(data)
      validate_config!      
        
      data.as_json.to_json
        
      uri = URI(STACKREDUCE_API_URL)
      res = Net::HTTP.post_form(uri, 'token' => Stackreduce.config.token, 'app' => Stackreduce.config.app_id, 'stack_data' => data)
      ActiveSupport::JSON.decode(res.body)
    end
    
  end
end
