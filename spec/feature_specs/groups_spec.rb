require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "listing groups" do
  
  describe "Default Cocoa Project" do
    before(:each) do
      @project = File.dirname(__FILE__) + '/../../test_data/Default Cocoa Project/Default Cocoa Project.xcodeproj'
      @reader = XcodeprojReader::Reader.new(@project)
    end
    
    it "should return the number of groups" do
      @reader.groups.size.should == 5
    end
    
    it "should return the groups" do
      @reader.groups.should == ["Classes", "Other Sources", "Resources", "Frameworks", "Products"]
    end
  end
  
end
