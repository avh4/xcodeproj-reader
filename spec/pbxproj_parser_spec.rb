require File.dirname(__FILE__) + '/spec_helper.rb'

describe PbxprojParser do
  
  class ParseMatcher
    def initialize(string)
      @string = string
    end
    def matches?(target)
      @parser = target
      @parser.parse(@string) != nil
    end
    def failure_message
      @parser.failure_reason
    end
  end
  def parse(string)
    ParseMatcher.new(string)
  end
  
  
  before(:each) do
    @parser = PbxprojParser.new
  end
  def should_parse(text)
    text = text.indent(-6).gsub(/^\n/, '')
    @parser.should parse(text)
  end
  it "should parse an empty document" do
    should_parse(%{
      // !$*UTF8*$!
    })
  end
  it "should parse a document with an empty map" do
    should_parse(%{
      // !$*UTF8*$!
      {
        
      }
    })
  end
  it "should parse a document with an map containing integers" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tarchiveVersion = 1;
      \tobjectVersion = 45;
      }
    })
  end
  it "should parse a document with an map containing an object" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \trootObject = 29B97313FDCFA39411CA2CEA /* Project object */;
      }
    })
  end
  it "should parse a document with an map containing an empty block" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tclasses = {
      \t};
      }
    })
  end
  it "should parse a document with an map containing a block with comments" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tobjects = {
      /* Begin PBXBuildFile section */
      \t};
      }
    })
  end
  it "should parse a document with an map containing a block with an integer" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tobjects = {
      \t\t1D3623260D0F684500981E51 /* Default_iPhoneAppDelegate.m in Sources */ = 45;
      \t};
      }
    })
  end
  it "should parse a document with an map containing a block with a block with an integer" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tobjects = {
      \t\t1D3623260D0F684500981E51 /* Default_iPhoneAppDelegate.m in Sources */ = {isa = 45; };
      \t};
      }
    })
  end
  it "should parse a document with an map containing a block with a block" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tobjects = {
      \t\t1D3623260D0F684500981E51 /* Default_iPhoneAppDelegate.m in Sources */ = {isa = PBXBuildFile; fileRef = 1D3623250D0F684500981E51 /* Default_iPhoneAppDelegate.m */; };
      \t};
      }
    })
  end
  it "should parse a document with an map containing a block with a block containing empty lines and comments" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tobjects = {
      
      /* Begin PBXBuildFile section */
      \t\t1D3623260D0F684500981E51 /* Default_iPhoneAppDelegate.m in Sources */ = {isa = PBXBuildFile; fileRef = 1D3623250D0F684500981E51 /* Default_iPhoneAppDelegate.m */; };
      \t};
      }
    })
  end
  it "should parse filetype values" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tlastKnownFileType = wrapper.framework;
      }
    })
  end
  it "should parse 'Foundation.framework'" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tname = Foundation.framework;
      }
    })
  end
  it "should parse filesystem paths" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tpath = System/Library/Frameworks/Foundation.framework;
      }
    })
  end
  it "should parse filenames with underscores" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tpath = Default_iPhoneAppDelegate.h;
      }
    })
  end
  it "should parse filenames with strings" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tsourceTree = "<group>";
      }
    })
  end
  it "should parse arrays" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tfiles = (
      \t\t1D60589F0D05DD5A006BFB54 /* Foundation.framework in Frameworks */,
      \t\t1DF5F4E00D08C38300B7A737 /* UIKit.framework in Frameworks */,
      \t\t2892E4100DC94CBA00A64D0F /* CoreGraphics.framework in Frameworks */,
      \t);
      }
    })
  end
  it "should parse empty arrays" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tbuildRules = (
      \t);
      }
    })
  end
  
  
  
  it "should parse a real Xcode project file" do
    @parser.should parse(File.read(File.dirname(__FILE__) + "/../test_data/Default iPhone/Default iPhone.xcodeproj/project.pbxproj"))
  end
end
