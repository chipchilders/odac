require 'cs_capacityretriever/config'
require 'cs_capacityretriever/dbaccess'
require 'cloudstack_ruby_client'

require 'json'

module CsCapacityretriever
  class CollectData
    def collect()
      collected_time = Time.new
      db = DbAccess.new()
      client = CloudstackRubyClient::Client.new(Config::CLOUDSTACK_URL, Config::CLOUDSTACK_API_KEY, Config::CLOUDSTACK_SECRET_KEY, false)

      zones = client.list_zones({"showcapacities" => "true"})
      zones["zone"].each do |zone|
        zone["collected_time"] = collected_time
        zone["zoneid"] = zone["id"]
        db.write("zone", zone.to_json)

        pods = client.list_pods({
          "showcapacities" => "true", 
          "pagesize" => 500,
          "page" => 1, 
          "zoneid" => zone["id"]
        })

        pods["pod"].each do |pod|
          pod["collected_time"] = collected_time
          db.write("pod", pod.to_json)

          clusters = client.list_clusters({
            "showcapacities" => "true",
            "pagesize" => 500,
            "page" => 1,
            "podid" => pod["id"]
          })

          clusters["cluster"].each do |cluster|
            cluster["collected_time"] = collected_time
            db.write("cluster", cluster.to_json)

            hosts = client.list_hosts({
              "showcapacities" => "true",
              "pagesize" => 500,
              "page" => 1,
              "clusterid" => cluster["id"]
            })

            hosts["host"].each do |host|
              host["collected_time"] = collected_time
              db.write("host", host.to_json)
            end

            storagepools = client.list_storage_pools({
              "pagesize" => 500,
              "page" => 1,
              "clusterid" => cluster["id"]
            })

            storagepools["storagepool"].each do |storagepool|
              storagepool["collected_time"] = collected_time
              db.write("storagepool", storagepool.to_json)
            end

          end

          regions = client.list_regions()
          regions["region"].each do |region|
            region["collected_time"] = collected_time
            db.write("region", region.to_json)
          end

        end
      end
    end
  end
end
