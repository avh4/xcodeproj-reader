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
  it "should parse a document with an map containing an empty block" do
    should_parse(%{
      // !$*UTF8*$!
      {
      \tclasses = {
      \t};
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
end
