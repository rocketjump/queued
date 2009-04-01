require 'queued/queue'

module Queued
  module Services
    module Test
      
      class Queue < Queued::Queue
        
        ##
        # Create a new queue on the given +service+.
        # 
        def self.create(service, name)
          true
        end


        ##
        # Returns an integer representing the number of visible messages in the 
        # queue.
        # 
        def size
          _sent_messages.size
        end

        ##
        # Empties the queue of all visible messages, effectively clearing the 
        # queue.
        # 
        def clear!
          _sent_messages.clear
        end

        ##
        # Permanently destroys (deletes) the queue from its +Service+.
        # 
        def destroy
          @service.queues.delete(@name)
        end

        ##
        # Returns the next +Message+ in the queue.
        # 
        def first
          _sent_messages.first
        end

        ##
        # Returns a new message for the queue.
        # 
        def build_message(*args)
          options = args.extract_options!
          Queued::Services::Test::Message.new(self, options[:id], options[:body])
        end

        ##
        # Sends a +message+ to the queue.
        # 
        def send_message(message)
          _sent_messages << message
          true
        end
        
        
        def _sent_messages
          @messages ||= []
        end
        
      end
      
    end
  end
end
