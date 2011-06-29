require 'ostruct'
require 'monster_mash'

require 'ip2location/version'
require 'ip2location/base'
require 'ip2location/request'

module Ip2Location
  BASE_URI = "http://api.ip2locationapi.com/"
  @api_key  = nil
  @user     = nil
  
  class << self
    attr_accessor :api_key, :user
    
    def setup
      yield self if block_given?
    end
    
    def request(ip)
      Ip2Location::Request.ip2l(ip)
    end
    alias_method :ip2l, :request
     
  end
  
  class InvalidApiKeyError < StandardError; end
  class NoLocationDataError < StandardError; end
  class APIConnectionError < StandardError; end
end