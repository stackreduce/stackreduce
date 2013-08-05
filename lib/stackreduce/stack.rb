require 'json'
require 'net/http'
require 'stackreduce/exceptions'


module Stackreduce

  class Stack
    def self.config_is_valid?
      !(Stackreduce.token.blank? or Stackreduce.app_id.blank?)
    end
    
    def self.validate_config!
      Stackreduce.exception("Config is not valid: #{Stackreduce.token}:#{Stackreduce.app_id}") unless config_is_valid?
    end

    def self.parse(data_array)
      data = nil
      begin
        data =  ActiveSupport::JSON.encode(data_array)
      rescue ActiveSupport::JSON.parse_error
        Stackreduce.exception ActiveSupport::JSON.parse_error
      end
      data
    end
    
    def self.push(data, options = {})
      validate_config!      
      data = parse(data)
      name = options[:name] ||= nil
      
      params = {'token' => Stackreduce.token,'app_id' => Stackreduce.app_id,'stack_data' => data}
      params.merge!('name' => name) unless data.nil?
      
      

      uri = URI("http://localhost:3000/api/v1/apps/#{Stackreduce.app_id}/create_stack.json")
      res = Net::HTTP.post_form(uri, params)
      
      handle_response res
    end
    
    def self.handle_response res
      res.code == "200" ? ActiveSupport::JSON.decode(res.body) : Stackreduce.exception("Response: #{res.inspect}") 
    end
  end
end
