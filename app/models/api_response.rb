class ApiResponse
  attr_reader :raw_api_response

  def initialize(raw_api_response)
    @raw_api_response = raw_api_response
  end

  def lsoa
    JSON.parse(raw_api_response).dig("result", "lsoa")
  end
end

