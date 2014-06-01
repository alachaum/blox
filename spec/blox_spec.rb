require_relative 'spec_helper'

describe Blox do
  before(:each) do
    Blox.config = nil
  end
  
  describe "configuration" do
    it "should have the right default config" do
      Blox.configure
      expect(Blox.config.root_path).to eq('/blox')
    end
    
    it "should configure properly" do
      Blox.configure { |c| c.root_path = '/bla' }
      expect(Blox.config.root_path).to eq('/bla')
    end
  end
  
  describe "root_path" do
    it "is a method" do
      expect(Blox).to respond_to(:root_path)
    end
    
    it "initializes the default config if not initialized" do
      expect(Blox.root_path).to eq('/blox')
      expect(Blox.repo_source).to eq('https://github.com/blox/pack-')
    end
  end
  
  it "has the right particles_path" do
    expect(Blox.particles_path).to eq("#{Blox.root_path}/particles")
  end
  
  it "has the right packs_path" do
    expect(Blox.packs_path).to eq("#{Blox.root_path}/packs")
  end
  
  describe "fetch_pack" do
    before(:each) do
      Blox.configure do |c| 
        c.repo_source = File.expand_path('./spec/fixtures/repo') + '/'
        c.root_path = File.expand_path('./spec/tmp/blox')
      end
      FileUtils.rm_rf(Dir.glob('./spec/tmp/*'))
    end
    
    it "is a method" do
      expect(Blox).to respond_to(:fetch_pack)
    end
    
    it "fetch a pack from the right source" do
      packname = "myapp"
      Blox.fetch_pack(packname)
      expect(File.exists?("./spec/tmp/blox/packs/#{packname}/somefile")).to be_true
    end
  end
end