module Queued
  
  class Service
    
    def queues
      raise(NotImplementedError, "You must override the queues method for #{self.class.name}")
    end
    
    def queue(queue_name)
      raise(NotImplementedError, "You must override the queue() method for #{self.class.name}")
    end
    
  end
  
end
