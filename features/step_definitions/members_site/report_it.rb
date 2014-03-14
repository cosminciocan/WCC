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
