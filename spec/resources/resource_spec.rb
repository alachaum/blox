require_relative '../spec_helper'

describe Blox::Resource do
  it "has an install method" do
    expect(described_class.new).to respond_to(:install)
    expect(described_class.new.install).to be_true
  end
  
  it "has a version attribute" do
    expect(described_class.new).to respond_to(:version)
    expect(described_class.new).to respond_to(:version=)
    expect(described_class.new.version).to eq(0)
  end
  
  describe "id" do
    it "returns the name of the class" do
      class MyApp < Blox::Resource;end
      resource = MyApp.new
      expect(resource.id).to eq('my_app')
    end
  end
  
  describe "human_version" do
    it "is a method" do
      expect(described_class.new).to respond_to(:human_version)
    end
    
    it "return nil if no version to human_version mapping" do
      expect(described_class.new.human_version).to be_nil
    end
    
    it "return the human_version from the mapping" do
      resource = described_class.new
      resource.human_version_mapping = {'0' => "0.0.0"}
      expect(resource.human_version).to eq("0.0.0")
    end
  end
  
  describe "particle_path" do
    it "is a method" do
      expect(described_class.new).to respond_to(:particle_path)
    end
    
    it "returns the right particle_path" do
      resource = described_class.new
      expect(resource.particle_path).to eq("#{Blox.particles_path}/#{resource.id}")
    end
  end
  
  describe "pack_path" do
    it "is a method" do
      expect(described_class.new).to respond_to(:pack_path)
    end
    
    it "returns the right pack_path" do
      resource = described_class.new
      expect(resource.pack_path).to eq("#{Blox.packs_path}/#{resource.id}")
    end
  end
end