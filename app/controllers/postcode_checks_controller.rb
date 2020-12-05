class PostcodeChecksController < ApplicationController
  def result
    @result = Checker.postcode_allowed?(api_client, lsoa_allowed_list, params[:postcode]) ? "allowed" : "prohibited"
  end

  private

  def api_client
    ApiClient.new
  end

  def lsoa_allowed_list
    [
      "Southwark",
      "Lambeth",
    ]
  end
end
