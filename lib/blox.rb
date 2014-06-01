require 'blox/version'
require 'blox/resource'

module Blox
  class << self
    attr_accessor :config
  end
  
  def self.configure(&block)
    self.config ||= Configuration.new
    yield(config) if block
  end
  
  def self.root_path
    self.configure unless self.config
    self.config.root_path
  end
  
  def self.particles_path
    self.configure unless self.config
    self.config.root_path + '/particles'
  end
  
  def self.packs_path
    self.configure unless self.config
    self.config.root_path + '/packs'
  end
  
  class Configuration
    attr_accessor :root_path
    
    def initialize
      @root_path = '/blox'
    end
  end
end