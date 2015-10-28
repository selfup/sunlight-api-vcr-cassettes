class SunlightService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://congress.api.sunlightfoundation.com")
    connection.query[:apikey] = ENV["SUN_KEY"]
  end

  def legislators(params)
    parse(connection.get("legislators", params))['results']
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end
