When(/^I navigate to the pre-application advice page$/) do
  visit PreApplicationAdvicePage
end

When(/^I enter the postcode "([^"]*)"$/) do |postcode|
  on_page(PreApplicationAdvicePage).postcode_field = postcode
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

When(/^I fill in all the contact details$/) do
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

Then(/^I can't proceed forward$/) do
  on_page(PreApplicationAdvicePage).error_message_box_element.exists?.should == true
end

When(/^The error message "([^"]*)" should be displayed$/) do |error_message|
  on_page(PreApplicationAdvicePage).browser.text.include?(error_message).should be_true
end

When(/^I select Find Address$/) do
  on_page(PreApplicationAdvicePage).find_address_button
end

Then(/^A pop-up alert should be displayed$/) do
  on_page(PreApplicationAdvicePage).browser.alert.exists?.should be_true
end

When(/^The text from the alert should read "([^"]*)"$/) do |message|
  on_page(PreApplicationAdvicePage).browser.alert.text.include?(message).should be_true
  on_page(PreApplicationAdvicePage).browser.alert.ok
end

When(/^I enter an incorrect email format$/) do
  on_page(PreApplicationAdvicePage).contact_email = "1234567890"
end

Given(/^I select not to pay on behalf of the client$/) do
  on_page(PreApplicationAdvicePage).select_not_paying_for_pre_app
end

When(/^I fill in all the billing details$/) do
  on_page(PreApplicationAdvicePage).set_billing_details
end

When(/^I enter an incorrect billing email format$/) do
  on_page(PreApplicationAdvicePage).billing_email = "1234567890"
end

When(/^The billing details are not the same as contact details$/) do
  on_page(PreApplicationAdvicePage).select_not_same_details
end

When(/^I enter an incorrect client billing email format$/) do
  on_page(PreApplicationAdvicePage).client_billing_email = "1234567890"
end

Then(/^I fill in all the client billing details$/) do
   on_page(PreApplicationAdvicePage).set_client_details
end