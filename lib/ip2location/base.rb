module Ip2Location  
  class Base < MonsterMash::Base
    defaults do
      cache_timeout 999999
      user_agent "Ip2LocationAPI Ruby [v#{VERSION}]"
      params  :key => Ip2Location.api_key,
              :user => Ip2Location.user
    end
  end
end