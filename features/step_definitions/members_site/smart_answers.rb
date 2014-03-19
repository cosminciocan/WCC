When(/^I navigate to a Smart Answer form$/) do
   visit(CreatedContentPage).browser.text.include?("SMART ANSWER TITLE TEST")
end

When(/^I complete a flow for it$/) do
   on_page(CreatedContentPage).complete_smart_answer
end

Then(/^The result for the Smart Answer should be displayed$/) do
  on_page(CreatedContentPage).result_title.include?("Result Title").should == true
end

