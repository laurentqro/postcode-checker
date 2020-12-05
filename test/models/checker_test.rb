require 'test_helper'

class ApiClientAllowedPostcodeStub
  def lookup_postcode(postcode)
    {
      "status": 200,
      "result": {
        "lsoa": "Fooshire 034A"
      }
    }
  end
end

class ApiClientProhibitedPostcodeStub
  def lookup_postcode(postcode)
    {
      "status": 200,
      "result": {
        "lsoa": "Barshire 035B"
      }
    }
  end
end

class CheckerTest < ActiveSupport::TestCase
  test "allowed postcode" do
    api_client = ApiClientAllowedPostcodeStub.new
    lsoa_allowed_list = ["foo"]

    assert Checker.postcode_allowed?(api_client, lsoa_allowed_list, "foo")
  end

  test "prohibited postcode" do
    api_client = ApiClientProhibitedPostcodeStub.new
    lsoa_allowed_list = ["foo"]

    assert_not Checker.postcode_allowed?(api_client, lsoa_allowed_list, "bar")
  end
end
