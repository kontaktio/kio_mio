class PresenceJob
  include SuckerPunch::Job

  def perform(client, mac)
    PresenceService.new.get_presence(client, mac)
  end
end


# can you use activejob after perform to refresh a web page?
