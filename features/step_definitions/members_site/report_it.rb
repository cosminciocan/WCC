When(/^I navigate to the Report It page$/) do
  visit(ReportItPage).roads_and_pavements
  @street_name = "Abbey Gardens"
  @street_details = "TEST DETAILS"
  @describe_problem = "TEST PROBLEM DESCRIBED"
end

When(/^I submit a Roads and pavements report$/) do
  on_page(ReportItPage).damage_to_road_element.click
  @current_page.still_report_issue
  @current_page.address_of_problem_street = @street_name
  @current_page.address_of_problem_details = @street_details
  @current_page.describe_problem = @describe_problem
  @current_page.next_button
  sleep 1
  on_page(ReportItPage).browser.div(:class => 'sp-head-wrap').send_keys :home
  @current_page.inside_lane_element.click
  @current_page.preferred_contact_none_element.click
  @current_page.submit_button
end

Then(/^I should receive a confirmation message$/) do
  on_page(ReportItPage).browser.text.include?("Thanks for reporting!").should == true
end
