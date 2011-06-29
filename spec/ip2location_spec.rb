require 'spec_helper'
require 'ip2location'

describe Ip2Location do
  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
  
  describe "#setup" do
    it "should take @api_key and @user" do
      Ip2Location.setup do |s|
        s.api_key = "1234"
        s.user    = "username"
      end
      
      Ip2Location.api_key.should eq "1234"
      Ip2Location.user.should eq "username"
    end
  end
  
end
