When(/^I navigate to the pre-application advice page$/) do
  visit PreApplicationAdvicePage
end

When(/^I enter the postcode "([^"]*)"$/) do |postcode|
  on_page(PreApplicationAdvicePage).postcode_field = postcode
  @current_page.find_address_button
end

When(/^I select an address from the dropdown$/) do
  on_page(PreApplicationAdvicePage).select_address
end

Then(/^I proceed to the next step$/) do
  on_page(PreApplicationAdvicePage).next_step_button
end

When(/^I enter a description$/) do
  on_page(PreApplicationAdvicePage).describe_field = "TEST DESCRIPTION"
end

When(/^I proceed to the final step$/) do
  on_page(PreApplicationAdvicePage).next_step_button
end

When(/^I fill in all the mandatory fields$/) do
  on_page(PreApplicationAdvicePage).set_contact_details
end

When(/^I select to pay on behalf of the client$/) do
  on_page(PreApplicationAdvicePage).select_paying_for_pre_app
  on_page(PreApplicationAdvicePage).select_same_details
end

When(/^I submit my application$/) do
  on_page(PreApplicationAdvicePage).submit_app_button
end

Then(/^A confirmation page is displayed$/) do
  on_page(PreApplicationAdvicePage).browser.text.include?("Your pre-application advice request has been submitted!").should == true
end