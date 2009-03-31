require 'queued/message'

module Queued
  module Services
    module AmazonSqs
      
      class Message < Queued::Message
        
        def initialize(queue, id = nil, body = nil, sqs_message = nil)
          super(queue, id, body)
          if sqs_message
            @id           ||= sqs_message.id
            @body         ||= sqs_message.body
            @sqs_message  = sqs_message
          end
        end
        
        def send
          @queue.send_message(self) unless @sqs_message
        end
        
        def delete
          @sqs_message.delete if @sqs_message
        end
        
        def to_sqs_message
          @sqs_message || RightAws::SqsGen2::Message.new(@queue.queue, @id, nil, @body)
        end
        
      end
      
    end
  end
end
