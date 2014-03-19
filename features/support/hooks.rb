require 'watir-webdriver'

case ENV['browser']
  when 'chrome'
    browser = Watir::Browser.new :chrome
  when 'ie'
    browser = Watir::Browser.new :ie
  else
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile.native_events = false
    browser = Watir::Browser.new :firefox#, :profile => 'Automation'
end

Before('~@headless') do
  @browser = browser
  @browser.cookies.clear
 # @browser.window.move_to(-1000, -1100)
  @browser.window.resize_to(1350, 720)
  @browser.driver.manage.timeouts.implicit_wait = 5
end

After('@delete_cookies') do
  @browser.cookies.clear
end

#TODO: need to make sure that this is clearing after each test!
After do
  @browser.cookies.clear
end

After do |scenario|
  if scenario.failed?
    @browser.driver.save_screenshot("results/screenshots/#{scenario.__id__}.png")
    embed("screenshots/#{scenario.__id__}.png", "image/png", "Screenshot of error during '#{scenario.name}'")
  end
end

at_exit do
  browser.close unless browser.nil?
  @browser.close unless @browser.nil?
end