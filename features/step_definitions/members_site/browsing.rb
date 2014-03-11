When(/^I access the homepage$/) do
  visit Homepage
end
Then(/^I see the homepage content$/) do
  on_page(Homepage).browser.text.include?("Welcome").should == true
end