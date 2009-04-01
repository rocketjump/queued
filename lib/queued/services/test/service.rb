require 'queued/service'

module Queued
  module Services
    module Test
      
      class Service < Queued::Service
        
        def initialize(options = {})
          @queues = {}
          
          options[:queues].each do |queue|
            generate_queue(queue)
          end if options[:queues].respond_to?(:each)
        end
        
        ##
        # See Queued::Service.queues
        # 
        def queues
          @queues.values
        end
        
        ##
        # See Queued::Service.queue
        # 
        def queue(queue_name, create = false)
          generate_queue(queue_name) if create && !@queues.has_key?(queue_name)
          @queues[queue_name]
        end
        
        
        private
        
        
        def generate_queue(name)
          @queues[name] = Queued::Services::Test::Queue.new(self, name)
        end
        
      end
      
    end
  end
end
