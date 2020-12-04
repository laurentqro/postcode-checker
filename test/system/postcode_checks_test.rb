require "application_system_test_case"

class PostcodeChecksTest < ApplicationSystemTestCase
   test "allowed postcode" do
     visit root_url
     fill_in "Postcode", with: "SE1 7QD"
     click_on "Check"

     assert_text "Postcode is allowed"
   end

   test "prohibited postcode" do
     visit root_url
     fill_in "Postcode", with: "AAA BBB"
     click_on "Check"

     assert_text "Postcode is prohibited"
   end
end
