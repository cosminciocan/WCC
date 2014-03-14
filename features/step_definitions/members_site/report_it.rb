When(/^I navigate to the Report It page$/) do
  visit(ReportItPage).roads_and_pavements
  @street_name = "Abbey Gardens"
  @street_details = "TEST DETAILS"
  @describe_problem = "TEST PROBLEM DESCRIBED"
end

When(/^I submit a Roads and pavements report$/) do
  puts "Select Damage to road"
  on_page(ReportItPage).damage_to_road_element.click
  puts "Select still report the issue"
  @current_page.still_report_issue
  puts "Enter street name"
  @current_page.address_of_problem_street = @street_name
  puts "Enter street details"
  @current_page.address_of_problem_details = @street_details
  puts "Enter probmel descriptiuon"
  @current_page.describe_problem = @describe_problem
  puts "Press next button"
  @current_page.next_button
  sleep 1
  puts "Scroll the page up"
  on_page(ReportItPage).browser.div(:class => 'sp-head-wrap').send_keys :home
  sleep 1
  puts "Select Inside lane"
  @current_page.inside_lane_element.click
  puts "selecting preferred contact"
  @current_page.preferred_contact_none_element.click
  @first_name = "First Name Test"
  @last_name = "Last Name Test"
  @your_address = "Address Test"
  @city_town = "City Test"
  @postal_code = "Postal Code Test"
  @email = "email@example.com"
  if on_page(ReportItPage).browser.text.include?("First Name")
   puts "If action triggered"
    @current_page.first_name = @first_name
    @current_page.last_name = @last_name
    @current_page.your_address = @your_address
    @current_page.city_town = @city_town
    @current_page.postal_code = @postal_code
    @current_page.email = @email
  end
  puts "Submit button"
  @current_page.submit_button

end

Then(/^I should receive a confirmation message$/) do
    on_page(ReportItPage).browser.text.include?("Thanks for reporting!").should == true
end
