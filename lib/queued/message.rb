module Queued
  
  ##
  # Basic class for managing queue messages.  This class should be inherited 
  # from / extended to correctly enable +send+ and +delete+ functionality for
  # each service.
  # 
  class Message
    
    attr_reader   :id       # Unique identifier of the message in the queue.
    attr_reader   :queue    # The queue in which this message belongs.
    
    def initialize(queue, id = nil, body = nil)
      @queue    = queue
      @id       = id
      self.body = body
    end
    
    ##
    # Sends the message to the +queue+.
    # 
    def send
      raise(NotImplementedError, "You must override the send method for #{self.class.name}")
    end
    
    ##
    # Deletes the message from the +queue+.
    # 
    def delete
      raise(NotImplementedError, "You must override the delete method for #{self.class.name}")
    end
    
    def body=(body_content)
      @body = body_content.kind_of?(String) ? body_content : body_content.to_yaml
    end
    
    def body
      YAML.load(@body)
    end
    
    ##
    # Returns the +body+ of the Message.
    # 
    def to_s
      @body
    end
    
  end
  
end
