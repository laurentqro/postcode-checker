class ApiClient
  include HTTParty
  BASE_URI = "https://api.postcodes.io"

  def lookup_postcode(postcode)
    uri = URI.encode(BASE_URI + "/postcodes/" + postcode)
    response = self.class.get(uri)
    ApiResponse.new(response.body)
  end
end
