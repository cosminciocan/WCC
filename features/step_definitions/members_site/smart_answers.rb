When(/^I navigate to a Smart Answer form$/) do
   visit(SmartAnswerPage).browser.text.include?("SMART ANSWER TITLE TEST")
end

When(/^I complete a flow for it$/) do
   on_page(SmartAnswerPage).complete_smart_answer
end

Then(/^The result for the Smart Answer should be displayed$/) do
  on_page(SmartAnswerPage).result_title.include?("Result Title").should == true
end

Then(/^I delete the created Smart Answer$/) do
  visit(EditContentPage).search_title = "SMART ANSWER TITLE TEST"
  on_page(EditContentPage).apply_search
  sleep 2
  while on_page(EditContentPage).delete_content_element.exists?
   puts "Deleting created Smart Answer"
   on_page(EditContentPage).delete_content
   on_page(EditContentPage).save_smart_answer
   sleep 1
   on_page(EditContentPage).browser.text.include?("Smart Answer SMART ANSWER TITLE TEST has been deleted.").should == true
   visit(EditContentPage).search_title = "SMART ANSWER TITLE TEST"
   on_page(EditContentPage).apply_search
   sleep 2
   puts "Smart Answer Deleted"
  end
  visit(ClearCachePage).clear_cache_button
end