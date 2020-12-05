class PostcodeChecksController < ApplicationController
  def result
    @result = Checker.postcode_allowed?(api_client, postcode_allowed_list, lsoa_allowed_list, params[:postcode]) ? "allowed" : "prohibited"
  end

  private

  def api_client
    ApiClient.new
  end

  def postcode_allowed_list
    [
      "SH24 1AA",
      "SH24 1AB",
    ]
  end

  def lsoa_allowed_list
    [
      "Southwark",
      "Lambeth",
    ]
  end
end
