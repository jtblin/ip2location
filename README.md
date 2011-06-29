ip2location
===========

Description
-----------


Examples
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
