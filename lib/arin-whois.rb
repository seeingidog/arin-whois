require 'active_resource'

module ARIN
  class Base < ActiveResource::Base
    self.site = "http://whois.arin.net/rest"
  end
  
  class POC < Base
    self.collection_name = "poc"
  end

  class Org < Base
    self.collection_name = "org"
  end

  class Net < Base
    self.collection_name = "net"
  end

  class ASN < Base
    self.collection_name = "asn"
  end

  class Customer < Base
    self.collection_name = "customer"
  end

  class Rdns < Base
    self.collection_name = "rdns"
  end
end
