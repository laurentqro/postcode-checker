class Checker

  def self.postcode_allowed?(api_client, postcode_allowed_list, lsoa_allowed_list, postcode)
    queried_postcode = api_client.lookup_postcode(postcode)

    return postcode_allowed_list.include?(postcode) if queried_postcode.not_found?

    if queried_postcode.found?
      lsoa_allowed_list.any? do |lsoa|
        queried_postcode.lsoa.downcase.start_with?(lsoa.downcase)
      end
    end
  end
end
