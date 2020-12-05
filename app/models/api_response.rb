class ApiResponse
  attr_reader :raw_api_response

  def initialize(raw_api_response)
    @raw_api_response = raw_api_response
  end

  def found?
    status == 200
  end

  def not_found?
    status == 404
  end

  def lsoa
    parsed_response.dig("result", "lsoa")
  end

  private

  def status
    parsed_response.dig("status")
  end

  def parsed_response
    JSON.parse(raw_api_response)
  end
end

