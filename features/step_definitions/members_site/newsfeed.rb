When(/^I select a newsfeed$/) do
  visit(CreatedContentPage)
end

Then(/^I should see the content$/) do
 on_page(CreatedContentPage).browser.text.include?($page_title).should be_true
end
