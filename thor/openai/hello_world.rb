require "openai"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAIKEY") )

response = client.images.generate(parameters: {
  prompt: "Sensors on the ceiling in a hospital room",
  size: "1024x1024" })

puts response.dig("data", 0, "url")
