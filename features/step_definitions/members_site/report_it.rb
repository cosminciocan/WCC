When(/^I navigate to the Report It page$/) do
  visit(ReportItPage)
end

When(/^I submit a Roads and pavements report$/) do
  on_page(ReportItPage).roads_and_pavements
  on_page(ReportItPage).submit_damage_to_roads
end

Then(/^I should receive a confirmation message$/) do
  on_page(ReportItPage).assert_confimation_message
end

And(/^I submit a Advertising and trading report$/) do
  on_page(ReportItPage).advertising_and_trading
  on_page(ReportItPage).submit_advertising_and_trading
end

And(/^I choose to place an Advertising and trading report for A Boards \(Sandwich Boards\)$/) do
  on_page(ReportItPage).advertising_and_trading
  on_page(ReportItPage).a_boards_report_element.click
end

Then(/^I press the next button without entering street$/) do
  on_page(ReportItPage).a_board_street = ""
  on_page(ReportItPage).a_board_street_number = $street_details
  on_page(ReportItPage).a_board_details = $describe_problem
  on_page(ReportItPage).next_button
end

Then(/^I press the next button without entering additional information$/) do
  on_page(ReportItPage).a_board_street = $street_name
  on_page(ReportItPage).a_board_street_number = ""
  on_page(ReportItPage).a_board_details = $describe_problem
  on_page(ReportItPage).next_button
end

Then(/^I press the next button without entering the problem description$/) do
  on_page(ReportItPage).a_board_street = $street_name
  on_page(ReportItPage).a_board_street_number = $street_details
  on_page(ReportItPage).a_board_details = ""
  on_page(ReportItPage).next_button
end

And(/^I fill in all the details and select the preferred contact Email$/) do
  on_page(ReportItPage).a_board_street = $street_name
  on_page(ReportItPage).a_board_street_number = $street_details
  on_page(ReportItPage).a_board_details = $describe_problem
  on_page(ReportItPage).next_button
  on_page(ReportItPage).preferred_contact_email_element.click
end

Then(/^I check the mandatory field error messages$/) do
   on_page(ReportItPage).check_field_validations_email
end

Then(/^I fill in all the details and select the preferred contact Phone$/) do
  on_page(ReportItPage).a_board_street = $street_name
  on_page(ReportItPage).a_board_street_number = $street_details
  on_page(ReportItPage).a_board_details = $describe_problem
  on_page(ReportItPage).next_button
  on_page(ReportItPage).preferred_contact_phone_element.click
end

