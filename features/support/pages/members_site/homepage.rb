class Homepage
  include PageObject


  page_url "#{EnvConfig['MEMBER_SITE_URL']}"

  text_field(:search_field, :id => 'edit-search-block-form--2')
  button(:search_button, :id => 'edit-submit')
  div(:autocomplete_suggestion_box, :class => 'apachesolr_autocomplete suggestion')
  span(:homepage_clock, :id => 'wcc-datetime')

  #News Section
  ul(:news_section, :class => 'news')
  link(:test_newsfeed, :href => '/automation-title-test')
  link(:more_news, :href => '/news')

   #Footer links
  link(:disclaimer, :href => '/disclaimer/')
  link(:privacy, :text => 'Privacy')
  link(:freedom_of_information, :href => '/freedom-of-information')
  link(:copyright, :href => '/copyright/')
  link(:accessibility, :href => '/accessibility')
  link(:terms_and_conditions, :href => '/terms-and-conditions-text-message-services')
  link(:cookies, :text => 'Cookies')

  def wait_for_suggestion_box
    browser.wait_until { self.autocomplete_suggestion_box_element.exists? }
  end

  def verify_time
    browser.wait_until { self.homepage_clock_element.exists? }
    sleep 1
    time = Time.now.utc.strftime("%H:%M")
    self.homepage_clock.should == time
  end
end