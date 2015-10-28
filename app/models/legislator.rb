class Legislator < OpenStruct
  def self.service
    @service ||= SunlightService.new
  end

  def self.find_by(params)
    service.legislators(params).map { |legislator| Legislator.new(legislator) }
  end
end
