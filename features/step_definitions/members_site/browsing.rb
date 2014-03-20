When(/^I access the homepage$/) do
  visit Homepage
end

Then(/^I see the homepage content$/) do
  on_page(Homepage).browser.text.include?("Welcome to Westminster").should == true
end

When(/^I click on the (.*) link$/) do |link|
  on_page(Homepage).browser.wait_until { on_page(Homepage).disclaimer_element.exists? }
  on_page(Homepage).browser.send_keys :end
  case link
    when "Disclaimer" then on_page(Homepage).disclaimer
    when "Privacy" then on_page(Homepage).privacy
    when "Freedom of Information" then on_page(Homepage).freedom_of_information
    when "Copyright" then on_page(Homepage).copyright
    when "Accessibility" then on_page(Homepage).accessibility
    when "Terms and conditions" then on_page(Homepage).terms_and_conditions
    when "Cookies" then on_page(Homepage).cookies
    else
      puts "Invalid user supplied Link!"
  end
end

Then(/^the (.*) page should be displayed$/) do |page|
  on_page(NewsPage).browser.windows.last.use
  @current_page.browser.text.include?(page).should be_true
  @current_page.browser.windows.last.close
  @current_page.browser.windows.first.use
end

Then(/^I should see the correct UK time$/) do
  on_page(Homepage).verify_time
end
