require 'spec_helper'
require 'ip2location'

describe Ip2Location::Request do
  it "should return a properly parsed Location structure" do    
    @api_key = "1fe480f5bac2c5261cf686f6265eed138953b98c"
    @user    = "ip2location_ruby"
    
    Ip2Location.setup do |s|
      s.api_key = @api_key
      s.user    = @user
    end

    Ip2Location.request("8.8.8.8").should eq Location.new("8.8.8.8", "US","United States","California","Mountain View","34.305","-86.2981")
  end
  
  describe "Parsing" do
    before(:all) do
      @no_data = "NO DATA"
      @bad_api = "Sorry, Invalid user name or API key!"
      @good_response = "US,United States,California,Mountain View,34.305,-86.2981"
    end

    it "should process responses properly" do
      ->{ Ip2Location::Request.check_response_for_errors(@no_data) }.should raise_error(NoLocationDataError, "The IP you requested has no associated location data.")
      ->{ Ip2Location::Request.check_response_for_errors(@bad_api) }.should raise_error(InvalidApiKeyError)
      ->{ Ip2Location::Request.check_response_for_errors(@good_response) }.should_not raise_error
    end

    it "should return body unless response matches an error" do
      Ip2Location::Request.check_response_for_errors(@good_response).should eq @good_response
    end
  end
end
