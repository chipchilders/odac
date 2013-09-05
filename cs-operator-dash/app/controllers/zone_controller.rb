class ZoneController < ApplicationController

  def index
    @threashold = 70
    @zone = Zone.all
    @lastupdate = @zone[0]["collected_time"]
    @CAPACITY_TYPE_MEMORY = 0
    @CAPACITY_TYPE_CPU = 1
    @CAPACITY_TYPE_STORAGE = 2
    @CAPACITY_TYPE_STORAGE_ALLOCATED = 3
    @CAPACITY_TYPE_VIRTUAL_NETWORK_PUBLIC_IP = 4
    @CAPACITY_TYPE_PRIVATE_IP = 5
    @CAPACITY_TYPE_SECONDARY_STORAGE = 6
    @CAPACITY_TYPE_VLAN = 7
    @CAPACITY_TYPE_DIRECT_ATTACHED_PUBLIC_IP = 8
    @CAPACITY_TYPE_LOCAL_STORAGE = 9
  end

  def json
    @zones = Zone.all
    render json: @zones
  end

  def jsonsingle
    @zone = Zone.where(:id => params[:id])[0]
    @zonehistory = Zone_History.where(:zoneid => params[:id])
    render json: @zonehistory
  end

  def view
    @threashold = 70
    @viewname = 'Overview'
    @zone = Zone.where(:id => params[:id])[0]
    @lastupdate = @zone["collected_time"]

    @hosts = Host.where(:zoneid => params[:id])

    @CAPACITY_TYPE_MEMORY = 0
    @CAPACITY_TYPE_CPU = 1
    @CAPACITY_TYPE_STORAGE = 2
    @CAPACITY_TYPE_STORAGE_ALLOCATED = 3
    @CAPACITY_TYPE_VIRTUAL_NETWORK_PUBLIC_IP = 4
    @CAPACITY_TYPE_PRIVATE_IP = 5
    @CAPACITY_TYPE_SECONDARY_STORAGE = 6
    @CAPACITY_TYPE_VLAN = 7
    @CAPACITY_TYPE_DIRECT_ATTACHED_PUBLIC_IP = 8
    @CAPACITY_TYPE_LOCAL_STORAGE = 9
  end

  def charts
    @viewname = 'Charts'
    @zone = Zone.where(:id => params[:id])[0]
    @zonehistory = Zone_History.where(:zoneid => params[:id])
    @lastupdate = @zone["collected_time"]

    @CAPACITY_TYPE_MEMORY = 0
    @CAPACITY_TYPE_CPU = 1
    @CAPACITY_TYPE_STORAGE = 2
    @CAPACITY_TYPE_STORAGE_ALLOCATED = 3
    @CAPACITY_TYPE_VIRTUAL_NETWORK_PUBLIC_IP = 4
    @CAPACITY_TYPE_PRIVATE_IP = 5
    @CAPACITY_TYPE_SECONDARY_STORAGE = 6
    @CAPACITY_TYPE_VLAN = 7
    @CAPACITY_TYPE_DIRECT_ATTACHED_PUBLIC_IP = 8
    @CAPACITY_TYPE_LOCAL_STORAGE = 9
  end

  def hosts
    @viewname = 'Hosts'
    @zone = Zone.where(:id => params[:id])[0]
    @lastupdate = @zone["collected_time"]
    @hosts = Host.where(:zoneid => params[:id])
  end

  def jsonhosts
    @hosts = Host.where(:zoneid => params[:id])
    render json: @hosts
  end

  def jsonhost
    @host = Host.where(:hostid => params[:hostid])
    render json: @host
  end

end
