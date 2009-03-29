require File.dirname(__FILE__) + '/spec_helper.rb'

describe PbxprojParser do
  before(:each) do
    @parser = PbxprojParser.new
  end
  def should_parse(text)
    text = text.indent(-6).gsub(/^\n/, '')
    @parser.parse(text).should_not be_nil
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
end
