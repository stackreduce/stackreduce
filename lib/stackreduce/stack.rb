require 'json'
require 'net/http'
require 'stackreduce/exceptions'


module Stackreduce

  class Stack

      END_POINT_URL = "http://www.stackreduce.com/api/v1/stacks.json"

    
    def self.config_is_valid? #:nodoc:
      !(Stackreduce.token.blank? or Stackreduce.app_id.blank?)
    end
    
    def self.validate_config! #:nodoc:
      Stackreduce.exception("Config is not valid: #{Stackreduce.config.inspect}") unless config_is_valid?
    end

    def self.parse(data_array)
      data = nil
      begin
        data =  ActiveSupport::JSON.encode(data_array)
        # rescue ActiveSupport::JSON.parse_error
      rescue e
        Stackreduce.exception e
      end
      data
    end
    
    def self.push(data, options)
      validate_config!      
      data = parse(data)
      name = options[:name] ||= nil
      
      params = {'token' => Stackreduce.token,'app_id' => Stackreduce.app_id,'stack_data' => data}
      params.merge!('name' => name) unless name.nil?

      uri = URI(END_POINT_URL)
      res = Net::HTTP.post_form(uri, params)
      
      handle_response res
    end
    
    def self.handle_response res #:nodoc:
      res.code == "200" ? ActiveSupport::JSON.decode(res.body) : Stackreduce.exception("Response: #{res.inspect}") 
    end
  end
end
