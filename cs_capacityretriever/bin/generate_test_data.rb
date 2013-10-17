#!/usr/bin/env ruby

require 'cs_capacityretriever'
require 'cs_capacityretriever/dbaccess'
require 'optparse'
require 'securerandom'
require 'json'

sample_host = { 
  "_id" => "fac36df7-ce3c-4e21-a1af-caeed10d51ca", 
  "name" => "SimulatedAgent.966bb91f-421b-41bf-9a8c-096b639530de", 
  "state" => "Up", 
  "disconnected" => "2013-08-30T16:26:40+0100", 
  "type" => "Routing", 
  "ipaddress" => "172.16.0.8", 
  "zoneid" => "dfd32812-4b6b-4c73-8039-5bb87c213471", 
  "zonename" => "Sandbox-simulator", 
  "podid" => "2b988648-0b00-4dd9-832a-28f3d2c54bcb", 
  "podname" => "POD0", 
  "version" => "4.2.0", 
  "hypervisor" => "Simulator", 
  "cpunumber" => 4, 
  "cpuspeed" => 8000, 
  "cpuallocated" => "0%", 
  "cpuused" => "0%", 
  "cpuwithoverprovisioning" => "32000.0", 
  "networkkbsread" => 32768, 
  "networkkbswrite" => 16384, 
  "memorytotal" => 8589934592, 
  "memoryallocated" => 2147483648, 
  "memoryused" => 0, 
  "capabilities" => "hvm", 
  "lastpinged" => "1970-01-16T14:46:22+0100", 
  "managementserverid" => 2200358551563, 
  "clusterid" => "42f98cbd-7ef1-47ab-9095-6481f5b667b3", 
  "clustername" => "C2", 
  "clustertype" => "CloudManaged", 
  "islocalstorageactive" => false, 
  "created" => "2013-08-29T19:50:28+0100", 
  "events" => "ShutdownRequested; StartAgentRebalance; AgentConnected; AgentDisconnected; PingTimeout; Ping; Remove; ManagementServerDown; HostDown", 
  "resourcestate" => "Enabled", 
  "hahost" => false, 
  "collected_time" => "2013-08-30 13:42:13 -0400", 
  "hostid" => "fac36df7-ce3c-4e21-a1af-caeed10d51ca" 
}


options = {}

optparse = OptionParser.new do|opts|
  options[:hosts_per_cluster] = 8
  opts.on( '-c', '--hosts-per-cluster NUM', Integer, "Number of hosts per cluster" ) do|f|
      options[:hosts_per_cluster] = f
  end
  options[:clusters_per_pod] = 4
  opts.on( '-p', '--clusters-per-pod NUM', Integer, "Number of clusters per pod" ) do|f|
    options[:clusters_per_pod] = f
  end
  options[:hosts_to_generate] = 36
  opts.on( '-x', '--hosts-to-generate NUM', Integer, "Number of hosts to generate" ) do|f|
      options[:hosts_to_generate] = f
  end
  options[:debug] = false
  opts.on( '-d', '--debug', 'Debug') do|d|
    options[:debug] = d
  end
  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end
end

optparse.parse!

puts "Generating json" if options[:debug]
puts options if options[:debug]

$currentpod = 0
$currentcluster = 0
$currenthost = 0

$currentpodname = ""
$currentpodid = ""
$currentclustername = ""
$currentclusterid = ""

$hosts = Array.new

def definenewpod()
  $currentpod +=1
  $currentpodname = "pod" + $currentpod.to_s
  $currentpodid = SecureRandom.uuid
  definenewcluster()
end

def definenewcluster()
  $currentcluster +=1
  $currentclustername = "cluster" + $currentcluster.to_s
  $currentclusterid = SecureRandom.uuid
end

db = CsCapacityretriever::DbAccess.new()
db.drop('host')
definenewpod()

while $currenthost < options[:hosts_to_generate] do
  newhost = sample_host.clone
  newid = SecureRandom.uuid
  newhost["_id"] = newid
  newhost["name"] = "FakeHost-" + newid
  newhost["hostid"] = newid
  newhost["name"] = "host" + $currenthost.to_s
  newhost["clusterid"] = $currentclusterid
  newhost["clustername"] = $currentclustername
  newhost["podid"] = $currentpodid
  newhost["podname"] = $currentpodname
  $hosts.push(newhost)
  db.write('host', newhost.to_json.to_s, no_history=true, skip_json_parse=false)
  $currenthost +=1

  if ($currenthost % options[:hosts_per_cluster]) == 0
    if ($currentcluster % options[:clusters_per_pod]) == 0
      definenewpod()
    else
      definenewcluster()
    end
  end
end

podcounter = -1
clustercounter = -1
hostcounter = 0
lastpodid = ''
lastclusterid = ''

$infra = {
    "pods" => Array.new,
    "zoneid" => $hosts[0]["zoneid"],
    "_id" => $hosts[0]["zoneid"]
}

$hosts.each do |host|
  if lastpodid != host["podid"]
    podcounter +=1
    clustercounter = -1
    $infra["pods"][podcounter] = { "podid" => host["podid"], "clusters" => Array.new }
  end
  if lastclusterid != host["clusterid"]
    clustercounter +=1
    $infra["pods"][podcounter]["clusters"][clustercounter] = { "clusterid" => host["clusterid"], "hostcount" => 0 }
  end
  $infra["pods"][podcounter]["clusters"][clustercounter]["hostcount"] +=1
  lastpodid = host["podid"]
  lastclusterid = host["clusterid"]
  hostcounter +=1
end

$infra["totalhostcount"] = hostcounter

db.write('infracounter', $infra.to_json.to_s, no_history=true, skip_json_parse=false)
