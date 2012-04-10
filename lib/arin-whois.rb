require 'rest_client'
require 'json'
require 'hashie'

module ARIN
  class Base
    def self.resource
      RestClient::Resource.new 'http://whois.arin.net/rest'
    end
    
    def self.parse_and_objectify(rootel, query)
      Hashie::Mash.new(JSON.parse(resource["#{rootel}/#{query}.json"].get)[rootel])
    end
  end
  
  class POC < Base
    
    def self.find(query)    
      rootel = 'poc'
      parse_and_objectify(rootel, query)
    end
  end

  class Org < Base
    def self.find(query)  
      rootel = 'org'
      parse_and_objectify(rootel, query)
    end
  end

  class Net < Base
    def self.find(query)  
      rootel = 'net'
      parse_and_objectify(rootel, query)
    end
  end

  class ASN < Base
    def self.find(query)
      rootel = 'asn'
      parse_and_objectify(rootel, query)
    end
  end

  class Customer < Base
    def self.find(query) 
      rootel = 'customer'
      parse_and_objectify(rootel, query)
    end
  end

  class Rdns < Base
    def self.find(query) 
      rootel = 'rdns'
      parse_and_objectify(rootel, query)
    end
  end
end
