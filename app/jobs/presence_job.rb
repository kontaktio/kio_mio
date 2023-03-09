class PresenceJob
  include SuckerPunch::Job

  def perform(client, mac)
    PresenceService.new.get_presence(client, mac)
  end
end
