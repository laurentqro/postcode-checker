require 'test_helper'

class ApiClientAllowedPostcodeStub
  def lookup_postcode(postcode)
    response = {
      "status": 200,
      "result": {
        "lsoa": "Fooshire 034A"
      }
    }.to_json

    ApiResponse.new(response)
  end
end

class ApiClientProhibitedPostcodeStub
  def lookup_postcode(postcode)
    response = {
      "status": 200,
      "result": {
        "lsoa": "Barshire 035B"
      }
    }.to_json

    ApiResponse.new(response)
  end
end

class ApiClientUnrecognisedPostcodeStub
  def lookup_postcode(postcode)
    response = {
      "status": 404,
      "error": "Postcode not found"
    }.to_json

    ApiResponse.new(response)
  end
end

class CheckerTest < ActiveSupport::TestCase
  test "postcode inside allowed LSOAs" do
    api_client = ApiClientAllowedPostcodeStub.new
    lsoa_allowed_list = ["foo"]
    postcode_allowed_list = []

    assert Checker.postcode_allowed?(api_client, postcode_allowed_list, lsoa_allowed_list, "foo")
  end

  test "postcode outside allowed LSOAs" do
    api_client = ApiClientProhibitedPostcodeStub.new
    lsoa_allowed_list = ["foo"]
    postcode_allowed_list = []

    assert_not Checker.postcode_allowed?(api_client, postcode_allowed_list, lsoa_allowed_list, "bar")
  end

  test "unrecognised postcode on allowed postcode list" do
    api_client = ApiClientUnrecognisedPostcodeStub.new
    lsoa_allowed_list = ["foo"]
    postcode_allowed_list = ["baz"]

    assert Checker.postcode_allowed?(api_client, postcode_allowed_list, lsoa_allowed_list, "baz")
  end
end
