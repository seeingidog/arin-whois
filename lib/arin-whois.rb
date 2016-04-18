require 'rest_client'
require 'json'
require 'hashie'

module ARIN
  class Base
    def self.resource
      RestClient::Resource.new 'http://whois.arin.net/rest'
    end
    
    def self.get_resource(rootel, query)
      begin
        resource["#{rootel}/#{query}.json"].get
      rescue RestClient::ResourceNotFound
        raise RecordNotFound
      end
    end
    
    def self.parse_and_objectify(rootel, query, parseel = rootel)
       Hashie::Mash.new(JSON.parse(get_resource(rootel, query))[parseel])
    end
    
    def self.root_element(classname)
      classname.split('::').last.downcase
    end
  end
  
  class RecordNotFound < StandardError
  end
  
  class POC < Base
    def self.find(query)    
      parse_and_objectify(root_element(self.name), query)
    end
  end

  class Org < Base
    def self.find(query)  
      parse_and_objectify(root_element(self.name), query)
    end
  end

  class Net < Base
    def self.find(query)  
      parse_and_objectify(root_element(self.name), query)
    end
  end

  class ASN < Base
    def self.find(query)
      parse_and_objectify(root_element(self.name), query)
    end
  end

  class Customer < Base
    def self.find(query) 
      parse_and_objectify(root_element(self.name), query)
    end
  end

  class Rdns < Base
    def self.find(query) 
      parse_and_objectify(root_element(self.name), query)
    end
  end

  class IP < Base
    def self.find(query)
      parse_and_objectify(root_element(self.name), query, 'net')
    end
  end
end
