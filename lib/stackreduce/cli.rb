require 'thor'
require 'stackreduce'

module Stackreduce
  class CLI < Thor


    desc "pluralize", "Pluralizes a word"
    method_option :word, :aliases => "-w"
    
    def pluralize
      puts Stackreduce::Stack.pluralize(options[:word])
    end
    
    
    desc "portray ITEM", "Determines if a piece of food is gross or delicious"
    def portray(name)
      puts Stackreduce::Stack.portray(name)
    end
    
    
  end
end