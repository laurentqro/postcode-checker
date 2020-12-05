class Checker

  def self.postcode_allowed?(api_client, lsoa_allowed_list, postcode)
    response = api_client.lookup_postcode(postcode)
    postcode_lsoa = response[:result][:lsoa]
    lsoa_allowed_list.any? { |lsoa| postcode_lsoa.downcase.start_with?(lsoa.downcase) }
  end
end
