class Homepage
  include PageObject


  page_url "#{EnvConfig['MEMBER_SITE_URL']}"

  text_field(:search_field, :id => 'edit-search-block-form--2')
  button(:search_button, :id => 'edit-submit')
  div(:autocomplete_suggestion_box, :class => 'apachesolr_autocomplete suggestion')
  span(:homepage_clock, :id => 'wcc-datetime')
  link(:feedback_button, :id => 'feedback-collector')
  link(:mobile_feedback_button, :id => 'feedback-collector-mobile')
  div(:expand_top_navigation_bar, :xpath => '//div[3]/div/div')
  link(:most_searched_link, :text => 'Most searched')
  link(:useful_information_link,:text => 'Useful information')
  link(:our_services_link,:text => 'Our services')
  link(:westminster_news_link,:text => 'Westminster news')

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


  #All you need to know about.. collections items:
  span(:first_collection, :css => 'form#views-form-front-page-extra-information-block-1 table#draggableviews-table-front_page_extra_information-block_1 > tbody > tr:nth-child(2) a > span')
  link(:second_collection, :xpath => '//tr[2]/td/a[2]/span')
  link(:third_collection, :xpath => '//tr[3]/td/a[2]/span')
  span(:page_title, :class => 'icon-generic icon-businesses')


  def wait_for_suggestion_box
    browser.wait_until { self.autocomplete_suggestion_box_element.exists? }
  end

  def verify_time
    browser.wait_until { self.homepage_clock_element.exists? }
    sleep 1
    time = Time.now.utc.strftime("%H:%M")
    self.homepage_clock.should == time
  end

  def browse_collections
    #x = self.first_collection_element.text
    #y = self.second_collection_element.text
    #z = self.third_collection_element.text

    self.first_collection_element.focus
    sleep 5
    self.first_collection
    #puts x
    #self.page_title.should == x
  end


end