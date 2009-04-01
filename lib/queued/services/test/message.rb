require 'queued/message'

module Queued
  module Services
    module Test
      
      class Message < Queued::Message
        
        def send
          @queue.send_message(self)
        end
        
        def delete
          true
        end
        
      end
      
    end
  end
end
