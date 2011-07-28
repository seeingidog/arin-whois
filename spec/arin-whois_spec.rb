require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ArinWhois" do
  it "should query ARIN for an AS number result" do
    ARIN::ASN.find(32244).name.should == "LIQUID-WEB-INC"
  end
end
