module Ip2Location
  Location = Struct.new(:ip, :country_code, :country, :region, :city, :latitude, :longitude)
  class Request < Base
    get(:ip2l) do |ip|
      uri "#{BASE_URI}"
      params  :user =>  Ip2Location.user,
              :key =>   Ip2Location.api_key,
              :ip   =>  ip
      handler do |response|
        puts response.effective_url
        if (parsed = Ip2Location::Request.parse_response(response.body, ip))
          parsed
        end
      end
    end
    
    def self.parse_response(body, ip)
      check_response_for_errors(body)
      location_parts = body.split(/,/)
      Location.new(ip, location_parts[0], location_parts[1], location_parts[2], location_parts[3], location_parts[4], location_parts[5])
    end
    
    def self.check_response_for_errors(body)
      case body
      when /Invalid user name or API key/
        raise InvalidApiKeyError, "The API key [#{Ip2Location.api_key}] or Username [#{Ip2Location.user}] is invalid!"
      when /NO DATA/
        raise NoLocationDataError, "The IP you requested has no associated location data."
      else 
        body
      end
    end
    
  end
end