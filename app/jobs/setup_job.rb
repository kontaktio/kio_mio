class SetupJob
  include SuckerPunch::Job

  def perform(client)
    SpaceService.new.get_spaces(client)
    DeviceService.new.get_devices(client)
  end
end

