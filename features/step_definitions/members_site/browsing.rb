When(/^I access the homepage$/) do
  visit(Homepage)
end

Then(/^I see the homepage content$/) do
  on_page(Homepage).browser.text.include?("Welcome to Westminster").should == true
end

When(/^I click on the (.*) link$/) do |link|
  on_page(Homepage).browser.wait_until { on_page(Homepage).disclaimer_element.exists? }
 # on_page(Homepage).browser.send_keys :end
  case link
    when "Disclaimer" then on_page(Homepage).disclaimer
    when "Privacy" then on_page(Homepage).privacy
    when "Freedom of Information" then on_page(Homepage).freedom_of_information
    when "Copyright" then on_page(Homepage).copyright
    when "Accessibility" then on_page(Homepage).accessibility
    when "Terms and conditions" then on_page(Homepage).terms_and_conditions
    when "Cookies" then on_page(Homepage).cookies
    else
      puts "Invalid user supplied Link!"
  end
end

Then(/^the (.*) page should be displayed$/) do |page|
  on_page(NewsPage).browser.windows.last.use
  @current_page.browser.text.include?(page).should be_true
  @current_page.browser.windows.last.close
  @current_page.browser.windows.first.use
end

Then(/^I should see the correct UK time$/) do
  on_page(Homepage).verify_time
end

When(/^I click on the All you need to know about collections$/) do
  on_page(Homepage).browse_collections
end

And(/^I navigate to the planning collection page$/) do
  visit(PlanningCollectionPage)
end

And(/^I select the first collection item$/) do
  @second_item = on_page(PlanningCollectionPage).second_collection_element.text
  @third_item = on_page(PlanningCollectionPage).third_collection_element.text
  @forth_item = on_page(PlanningCollectionPage).fourth_collection_element.text
  @fifth_item = on_page(PlanningCollectionPage).fifth_collection_element.text
  @sixth_item = on_page(PlanningCollectionPage).sixth_collection_element.text
  on_page(PlanningCollectionPage).first_collection_element.click
end

Then(/^I see the other relevant links box$/) do
  on_page(PlanningCollectionPage).first_relevant_link_element.text.should == @second_item
  on_page(PlanningCollectionPage).second_relevant_link_element.text.should == @third_item
  on_page(PlanningCollectionPage).third_relevant_link_element.text.should == @forth_item
  on_page(PlanningCollectionPage).fourth_relevant_link_element.text.should == @fifth_item
  on_page(PlanningCollectionPage).fifth_relevant_link_element.text.should == @sixth_item
end

Then(/^I check that the desktop version of the Feedback button exists$/) do
  on_page(Homepage).feedback_button_element.exists?.should be_true
end

And(/^I resize the window to "([^"]*)" per "([^"]*)"$/) do |width, height|
  on_page(Homepage).browser.window.resize_to(width, height)
end

Then(/^I check that the mobile version of the Feedback button exists$/) do
  on_page(Homepage).mobile_feedback_button_element.exists?.should be_true
end

Then(/^I expand the top navigation bar$/) do
  on_page(Homepage).expand_top_navigation_bar_element.click
end

And(/^I check the availability of the menu links$/) do
  on_page(Homepage).most_searched_link_element.exists?.should be_true
  on_page(Homepage).useful_information_link_element.exists?.should be_true
  on_page(Homepage).our_services_link_element.exists?.should be_true
  on_page(Homepage).westminster_news_link_element.exists?.should be_true
end
