require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ArinWhois" do
  it "should query ARIN for an AS number result" do
    ARIN::ASN.find(32244).name.values.first.should == "LIQUID-WEB-INC"
  end
  
  it "should query for org records" do
    ARIN::Org.find("LQWB").name.values.first.should == "Liquid Web, Inc."
  end
  
  it "should return a not found error for a 404" do
    lambda {ARIN::Org.find("LQWBZZZ")}.should raise_error ARIN::RecordNotFound
  end
end
