module Blox
  class Resource
    attr_accessor :id, :logs_path, :version, :human_version_mapping
    
    def initialize(opts = {})
      self.version = opts[:version] || 0
      self.human_version_mapping = opts[:human_version_mapping] || {}
    end
    
    def id
      self.class.to_s.underscore
    end
    
    # Steps involved in installing the resource
    def install
      true
    end
    
    def start
      true
    end
    
    def stop
      true
    end
    
    def restart
      self.start
      self.stop
    end
    
    def reload
      self.restart
    end
    
    def human_version
      self.human_version_mapping[self.version.to_s]
    end
    
    def particle_path
      "#{Blox.particles_path}/#{self.id}"
    end
    
    def pack_path
      "#{Blox.packs_path}/#{self.id}"
    end
  end
end