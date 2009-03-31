module Queued
  
  ##
  # Basic class for managing queues found on a queueing +Service+.  This class
  # should be inherited or extended to correctly enable the given 
  # functionality for each service.
  # 
  class Queue
    
    attr_reader   :name
    attr_reader   :service
    
    
    def initialize(service, name)
      @service  = service
      @name     = name
    end
    
    
    ##
    # Create a new queue on the given +service+.
    # 
    def self.create(service, name)
      raise(NotImplementedError, "You must override the create method for #{self.class.name}")
    end
    
    
    ##
    # Returns an integer representing the number of visible messages in the 
    # queue.
    # 
    def size
      raise(NotImplementedError, "You must override the size method for #{self.class.name}")
    end
    
    ##
    # Empties the queue of all visible messages, effectively clearing the 
    # queue.
    # 
    def clear!
      raise(NotImplementedError, "You must override the clear! method for #{self.class.name}")
    end
    
    ##
    # Permanently destroyes (deletes) the queue from its +Service+.
    # 
    def destroy
      raise(NotImplementedError, "You must override the destroy method for #{self.class.name}")
    end
    
    ##
    # Returns the next +Message+ in the queue.
    # 
    def first
      raise(NotImplementedError, "You must override the first method for #{self.class.name}")
    end
    
    ##
    # Returns a new message for the queue.
    # 
    def build_message(*args)
      raise(NotImplementedError, "You must override the first method for #{self.class.name}")
    end
    
    ##
    # Sends a +message+ to the queue.
    def send_message(message)
      raise(NotImplementedError, "You must override the first method for #{self.class.name}")
    end
    
  end
  
end
