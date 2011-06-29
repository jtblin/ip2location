ip2location
===========

Description
-----------
This is a stupid simple client for [IP2LocationAPI](http://www.ip2locationapi.com/) written with [David Balatero](https://github.com/dbalatero)'s awesome [monster_mash](https://github.com/dbalatero/monster_mash) library. I wrote it more or less 
as practice and to continue to familiarize myself with Ruby 1.9, RSpec, and Typhoeus.

Usage
--------
    require 'ip2location'
    
    # Ip2Location.api_key = YOUR_API_KEY
    # Ip2Location.user = YOUR_API_USERNAME
    #
    #  OR
    
    Ip2Location.setup do |s|
      s.api_key = YOUR_API_KEY
      s.user    = YOUR_API_USERNAME
    end

    puts Ip2Location.ip2l('8.8.8.8')
    #=> <struct Ip2Location::Location ip="8.8.8.8", country_code="US", country="United States", region="California", city="Mountain View", latitude="34.305", longitude="-86.2981">
  

Requirements
------------
  * monster_mash (~> 0.2.3)
  * A username and API key from [IP2LocationAPI](http://www.ip2locationapi.com/geoip-location-api/signup.php) (free)


Install
-------
`gem install ip2location`


Copyright
---------
Copyright (c) 2011 Ezekiel Templin

See LICENSE.txt for details.
