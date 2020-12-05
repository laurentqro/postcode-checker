require "application_system_test_case"

class PostcodeChecksTest < ApplicationSystemTestCase
  test "allowed postcode" do
    response = {
      "status": 200,
      "result": {
        "lsoa": "Southwark 034A"
      }
    }.to_json

    stub_request(:get, "https://api.postcodes.io/postcodes/foo").
      to_return(body: response)

    visit root_url
    fill_in "Postcode", with: "foo"
    click_on "Check"

    assert_text "Postcode is allowed"
  end

  test "prohibited postcode" do
    response = {
      "status": 200,
      "result": {
        "lsoa": "Barshire 034A"
      }
    }.to_json

    stub_request(:get, "https://api.postcodes.io/postcodes/bar").
      to_return(body: response)

    visit root_url
    fill_in "Postcode", with: "bar"
    click_on "Check"

    assert_text "Postcode is prohibited"
  end
end
