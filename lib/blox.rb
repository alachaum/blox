require 'active_support/all'
require 'open-uri'
require 'fileutils'
require 'zip'

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
  
  def self.tmp_path
    self.configure unless self.config
    self.config.root_path + '/tmp'
  end
  
  def self.repo_source
    self.configure unless self.config
    self.config.repo_source
  end
  
  def self.fetch_pack(pack_name)
    tmp_zip_path = "#{self.tmp_path}/#{pack_name}.zip"
    FileUtils.mkdir_p(File.dirname(tmp_zip_path))
    
    url = "#{self.repo_source}#{pack_name}/archive/production.zip"
    puts url
    open(tmp_zip_path,'wb') do |file|
      file << open(url).read
    end
    
    pack_path = "#{self.packs_path}/#{pack_name}"
    FileUtils.mkdir_p(File.dirname(pack_path))
    
    Zip::File.open(tmp_zip_path) do |zip_file|
      zip_file.each do |f|
        f_path=File.join(pack_path, f.name.split('/')[1..-1].join('/'))
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path)
      end
    end
    FileUtils.rm_rf(tmp_zip_path)
  end
  
  class Configuration
    attr_accessor :root_path, :repo_source
    
    def initialize
      @root_path = '/blox'
      @repo_source = 'https://github.com/blox/pack-'
    end
  end
end