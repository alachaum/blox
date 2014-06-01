module Blox
  class Resource
    
    # Steps involved in installing the resource
    def install
      true
    end
    
    # Path to the log file
    def logs_path
      nil
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
  end
end