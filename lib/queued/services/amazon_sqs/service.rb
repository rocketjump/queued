require 'queued/service'

begin
  require 'right_aws'
rescue LoadError
  puts "Please install the RightAws gem to use an AmazonSQS queue."
  exit(1)
end

module Queued
  module Services
    module AmazonSqs
      
      class Service < Queued::Service
        
        def initialize(options = {})
          @access_key_id      = options[:access_key_id]
          @secret_access_key  = options[:secret_access_key]
          sqs(options)
        end
        
        ##
        # See Queued::Service.queues
        # 
        def queues
          sqs_queues = sqs.queues
          sqs_queues.collect { |queue| Queued::Services::AmazonSqs::Queue.new(self, queue.name, queue) } if sqs_queues
        end
        
        ##
        # See Queued::Service.queue
        # 
        def queue(queue_name, create = false)
          sqs_queue = sqs.queue(queue_name, create)
          Queued::Services::AmazonSqs::Queue.new(self, queue_name, sqs_queue) if sqs_queue
        end
        
        def sqs_service #:nodoc:
          sqs
        end
        
        
        private
        
        
        def sqs(options = {})
          @sqs ||= RightAws::SqsGen2.new(@access_key_id, @secret_access_key, options)
        end
        
      end
      
    end
  end
end
