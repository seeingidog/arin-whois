require 'active_resource'

module ARIN
  class ARIN_Whois < ActiveResource::Base
    self.site = "http://whois.arin.net/rest"
  end
  class POC < ARIN_Whois
    self.collection_name = "poc"
  end
  class Org < ARIN_Whois
    self.collection_name = "org"
  end
  class Net < ARIN_Whois
    self.collection_name = "net"
  end
  class ASN < ARIN_Whois
    self.collection_name = "asn"
  end
  class Customer < ARIN_Whois
    self.collection_name = "customer"
  end
  class Rdns < ARIN_Whois
    self.collection_name = "rdns"
  end
end
