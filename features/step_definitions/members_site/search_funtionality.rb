When(/^I enter the keyword "([^"]*)"$/) do |keyword|
  @key_word = keyword
  on_page(Homepage).search_field = @key_word
end

When(/^I press the search button$/) do
  on_page(Homepage).search_button
end

Then(/^the result page is shown with results for my keyword$/) do
  on_page(SearchResultPage).browser.text.include?("Search results").should == true
  on_page(SearchResultPage).search_field.should == @key_word
  on_page(SearchResultPage).results.include?(@key_word).should == true
end

Then(/^A suggestion box is displayed under the search field$/) do
  on_page(Homepage).wait_for_suggestion_box
end

When(/^I select a suggestion from the drop-down$/) do
  @key_word = on_page(Homepage).autocomplete_suggestion_box
  on_page(Homepage).autocomplete_suggestion_box_element.click
end

Then(/^the result page is displayed without any results$/) do
  on_page(SearchResultPage).browser.text.include?("Search results").should == true
  on_page(SearchResultPage).results_element.exists?.should == false
end

When(/^Some tips are displayed on the page$/) do
  on_page(SearchResultPage).browser.text.include?("Check if your spelling is correct, or try removing filters.").should == true
  @current_page.browser.text.include?("Remove quotes around phrases to match each word individually").should == true
  @current_page.browser.text.include?("You can require or exclude terms using").should == true
end

When(/^A mandatory error message is displayed$/) do
  on_page(SearchResultPage).mandatory_error_message_element.exists?.should == true
  @current_page.mandatory_error_message.include?("Please enter some keywords.").should == true
end