Given /^I create (?:as|a) (.*) content type$/ do |content_type|
  case content_type
    when "Standard Smart Answer" then visit(CreateContentPage).create_standard_smart_answer
      when "Calculated Smart Answer" then visit(CreateContentPage)
  end
end

Then(/^I check if a test smart answer is created, and if not, I create one$/) do
  if visit(SmartAnswerPage).browser.text.include?("Sorry, we can't find this page.")
    visit(AdministratorLogin).login("valid Administrator")
    visit(ClearCachePage).clear_cache_button
    on_page(ClearCachePage).text.include?("Caches cleared").should == true
    on_page(AdministratorLogin).logout_button
    if visit(SmartAnswerPage).browser.text.include?("Sorry, we can't find this page.")
      puts "The test smart answer does not exist, proceeding in creating one..."
      puts "Logging into admin"
      visit(AdministratorLogin).login("valid Administrator")
      puts "Creating a standard Smart Answer"
      visit(CreateContentPage).create_standard_smart_answer
      puts "Adding the body for the Smart Answer"
      visit(EditContentPage).create_sa_body
      puts "Smart Answer body created!"
      puts "Clearing cache..."
      visit(ClearCachePage).clear_cache_button
      puts "Done. Logging out!"
      on_page(AdministratorLogin).logout_button
    end
    else puts "The test smart answer content type exists! Proceeding with the test."
  end
end
