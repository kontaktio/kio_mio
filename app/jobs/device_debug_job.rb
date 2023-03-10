require 'open3'

class DeviceDebugJob
  include SuckerPunch::Job

  def perform(client, device)
    command = "docker run position-debugging:0.1 --tracking-id " +
      device.mac + " --api-key " + client.api_key # + " --management-api-key abcd4321"

      # TODO add the magemock api key to the client model

    puts command
    stdout, stderr, status = Open3.capture3(command)
    device.position_debugging = stdout
    device.save
    puts stdout
  end
end
