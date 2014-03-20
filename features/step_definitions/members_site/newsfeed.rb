When(/^I navigate to a News Feed page$/) do
  visit(CreatedContentPage)
end

Then(/^I should see the content$/) do
 on_page(CreatedContentPage).browser.text.include?($page_title).should be_true
  on_page(CreatedContentPage).browser.text.include?($page_body).should be_true
end

Then(/^I should see the news feeds at the bottom of the page$/) do
  on_page(Homepage).news_section_element.exists?.should be_true
end

When(/^I should be able to select one$/) do
  on_page(Homepage).test_newsfeed
end

Then(/^I should be able to see its content$/) do
  on_page(CreatedContentPage).page_title.should == $page_title
  on_page(CreatedContentPage).page_body.include?($page_body).should be_true
end

When(/^I can select More News$/) do
 on_page(Homepage).more_news
end

Then(/^A page with all the latest news should be displayed$/) do
  on_page(NewsPage).collections_on_page_element.exists?.should be_true
end

When(/^I can select which news I want to read$/) do
  on_page(Homepage).test_newsfeed

end