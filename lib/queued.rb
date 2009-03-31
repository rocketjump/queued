$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'queued/message'
require 'queued/queue'
require 'queued/service'

module Queued
  VERSION = '0.0.1'
  
  @@service = :amazon_sqs
  
  def self.service=(service)
    @@service = service
  end
  
  def self.service(options = {})
    require "queued/services/#{@@service}"
    mod = Queued::Services.const_get(camelize(@@service))
    mod.const_get('Service').new(options)
  end
  
  
  private
  
  
  def self.camelize(string)
    string.to_s.gsub(/(?:^|_)(.)/) { $1.upcase }
  end
  
end