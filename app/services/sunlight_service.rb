class SunlightService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://congress.api.sunlightfoundation.com")
    connection.query[:apikey] = ENV["SUN_KEY"]
  end

  def legislators(gender)
    JSON.parse(connection.get("legislators", gender).body)
  end
end
