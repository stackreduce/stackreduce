module Stackreduce

  class StackreduceException < Exception
  end
  
  def self.exception e
    raise StackreduceException.new e
  end
  
end
