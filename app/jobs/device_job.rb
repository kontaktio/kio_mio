class DeviceJob
  include SuckerPunch::Job

  def perform(client)
    ds = DeviceService.new
    ds.clear_devices(client)
    ds.get_devices(client)
  end
end
