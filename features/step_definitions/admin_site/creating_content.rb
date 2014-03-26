Given /^I create (?:as|a) (.*) content type$/ do |content_type|
  case content_type
    when "Standard Smart Answer" then visit(CreateContentPage).smart_answer
    when "Calculated Smart Answer" then visit(CreateContentPage)
    when "Quick answer" then visit(QuickAnswerCreationPage)
    when "Random Named Quick answer" then visit(CreateContentPage).quick_answer
  end
  on_page(CreateContentPage).create_content(content_type)
end

Then(/^I check if a test "([^"]*)" is created, and if not, I create one$/) do |content_type|
  if visit(CreatedContentPage).browser.text.include?("Sorry, we can't find this page.")
    visit(AdministratorLogin).login("valid Administrator")
    visit(ClearCachePage).clear_cache_button
    if on_page(ClearCachePage).text.include?("Caches cleared")
      puts "Cache Cleared"
      else
      while on_page(ClearCachePage).text.include?("Temporarily Unavailable")
      visit(ClearCachePage).clear_cache_button
    end
    end
    on_page(AdministratorLogin).logout_button
    if visit(CreatedContentPage).browser.text.include?("Sorry, we can't find this page.")
      puts "The test content does not exist, proceeding in creating one..."
      puts "Logging into admin"
      visit(AdministratorLogin).login("valid Administrator")
      puts "Creating content"
      case content_type
        when "Standard Smart Answer" then visit(CreateContentPage).smart_answer
        when "News Feed" then visit(CreateContentPage).news_feed
      end
      on_page(CreateContentPage).create_content(content_type)
    end
  else puts "The test content type exists! Proceeding with the test."
  end
end

When(/^I verify the created content$/) do
  on_page(EditContentPage).verify_created_content
end

Then(/^I delete the created content$/) do
  visit(EditContentPage).delete_created_content
  visit(ClearCachePage).clear_cache_button
  if on_page(ClearCachePage).text.include?("Caches cleared")
    puts "Cache Cleared"
  else
    while on_page(ClearCachePage).text.include?("Temporarily Unavailable")
      visit(ClearCachePage).clear_cache_button
    end
  end
end

And(/^I create a test category$/) do
  visit.(Create).create_category
end
