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
    end
  end
  
  it "has the right store_path" do
    expect(Blox.store_path).to eq("#{Blox.root_path}/store")
  end
end