class ZoneController < ApplicationController

  def index
    @zone = Zone.last
    @lastupdate = @zone["collected_time"]
    @zonehistory = Zone.all
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
    @zones = Zone.last
    render json: @zones
  end

  def view
    @zone = Zone.last
    @zonehistory = Zone.all
    @zoneindex = params[:index].to_i
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

end
