require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "listing files" do
  
  describe "Default iPhone" do
    before(:each) do
      @project = File.dirname(__FILE__) + '/../../test_data/Default iPhone/Default iPhone.xcodeproj'
      @reader = XcodeprojReader::Reader.new(@project)
    end
    
    it "should return the classes" do
      @reader.files("Classes").should == ["RootViewController.h", "RootViewController.m", "Default_iPhoneAppDelegate.h", "Default_iPhoneAppDelegate.m"]
    end
  end
  
end
