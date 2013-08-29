require 'cs_capacityretriever/config'
require 'cs_capacityretriever/dbaccess'
require 'cloudstack_ruby_client'

require 'json'

module CsCapacityretriever
  class CollectData
    def collect()
      client = CloudstackRubyClient::Client.new(Config::CLOUDSTACK_URL, Config::CLOUDSTACK_API_KEY, Config::CLOUDSTACK_SECRET_KEY, false)
      zonedata = client.list_zones({"showcapacities" => "true"})
      zonedata["collected_time"] = Time.new
      db = DbAccess.new()
      db.write("zones", zonedata.to_json)
    end
  end
end
