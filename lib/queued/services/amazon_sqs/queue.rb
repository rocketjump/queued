require 'queued/queue'

module Queued
  module Services
    module AmazonSqs
      
      class Queue < Queued::Queue
        
        attr_reader :queue
        

        def initialize(service, name, queue = nil)
          super(service, name)
          @queue = queue
        end
        
        
        ##
        # Create a new queue on the given +service+.
        # 
        def self.create(service, name)
          queue = service.queue(name, true)
          Queue.new(service, name, queue)
        end


        ##
        # Returns an integer representing the number of visible messages in the 
        # queue.
        # 
        def size
          @queue.size
        end

        ##
        # Empties the queue of all visible messages, effectively clearing the 
        # queue.
        # 
        def clear!
          @queue.clear
        end

        ##
        # Permanently destroyes (deletes) the queue from its +Service+.
        # 
        def destroy
          @queue.delete(true) # forced!
        end

        ##
        # Returns the next +Message+ in the queue.
        # 
        def first
          message = @queue.receive
          Queued::Services::AmazonSqs::Message.new(self, nil, nil, messge) if message
        end
        
        ##
        # Builds and returns a new +Message+ for the queue.
        # 
        def build_message(*args)
          options = args.extract_options!
          Queued::Services::AmazonSqs::Message.new(self, options[:id], options[:body])
        end
        
        ##
        # Sends a +message+ to the queue.
        # 
        def send_message(message)
          sent_message = @queue.send_message(message.to_sqs_message)
          Queued::Services::AmazonSqs::Message.new(self, nil, nil, sent_message)
        end

      end
      
    end
  end
end
