require_relative '../spec_helper'

describe Blox::Resource do
  it "has an install method" do
    expect(described_class.new).to respond_to(:install)
    expect(described_class.new.install).to be_true
  end
  
  it "has a logs_path method" do
    expect(described_class.new).to respond_to(:logs_path)
    expect(described_class.new.logs_path).to be_nil
  end
  
  it "has a start method" do
    expect(described_class.new).to respond_to(:start)
    expect(described_class.new.start).to be_true
  end
  
  it "has a stop method" do
    expect(described_class.new).to respond_to(:stop)
    expect(described_class.new.stop).to be_true
  end
  
  describe "restart" do
    it "is a method" do
      expect(described_class.new).to respond_to(:restart)
      expect(described_class.new.restart).to be_true
    end
    
    it "calls stop then start" do
      resource = described_class.new
      expect(resource).to receive(:start).ordered
      expect(resource).to receive(:stop).ordered
      resource.restart
    end
  end
  
  describe "reload" do
    it "is a method" do
      expect(described_class.new).to respond_to(:reload)
      expect(described_class.new.reload).to be_true
    end
    
    it "calls restart" do
      resource = described_class.new
      expect(resource).to receive(:restart)
      resource.reload
    end
  end
end