class ReportItPage
  include PageObject

  page_url "#{EnvConfig['MEMBER_SITE_URL']}/report-it"


  link(:back_button, :href => '/report-it')
  #Advertising and Trading
  link(:advertising_and_trading, :href => '/report-it-advertising-and-trading')

  div(:a_boards_report, :class => 'form-item form-type-radio form-item-submitted-advertising-and-trading-advertising-and-trading-subcategs')
  text_field(:a_board_street, :id => 'edit-submitted-advertising-and-trading-details-street')
  text_field(:a_board_street_number, :id => 'edit-submitted-advertising-and-trading-details-can-we-have-more-detail-please')
  text_field(:a_board_details, :id => 'edit-submitted-advertising-and-trading-details-please-describe-the-problem')
  #Roads and pavements
  link(:roads_and_pavements, :href => '/report-it-roads-and-pavements')
  #div(:damage_to_road, :text => /Damage to the road/i)

  div(:damage_to_road, :class => 'form-item form-type-radio form-item-submitted-roads-and-pavements-roads-and-pavements-subcategs')

  button(:still_report_issue, :class => 'button road-report-submit fullw-mobile')
  div(:inside_lane, :class => 'form-item form-type-radio form-item-submitted-roads-and-pavements-extra-information-where-is-it-where-on-the-road-surface-is-the-problem')
  div(:preferred_contact_none, :class => 'form-item form-type-radio form-item-submitted-your-details-preferred-contact-list')
  #label(:preferred_contact_email, :class => 'option', :index => 1)
  label(:preferred_contact_phone, :text => 'Phone')
  label(:preferred_contact_email, :text => 'Email')
  text_field(:address_of_problem_street, :id => 'edit-submitted-roads-and-pavements-extra-information-enter-address-of-problem-street')
  text_field(:address_of_problem_details, :id => 'edit-submitted-roads-and-pavements-extra-information-enter-address-of-problem-can-we-have-more-detail-please')
  text_field(:describe_problem, :id => 'edit-submitted-roads-and-pavements-extra-information-enter-address-of-problem-please-describe-the-problem')

  #Your Details
  text_field(:first_name, :id => 'edit-submitted-your-details-your-details-wrapper-first-name')
  div(:first_name_div, :id => 'webform-component-your-details--your-details-wrapper--first-name')
  text_field(:last_name, :id => 'edit-submitted-your-details-your-details-wrapper-last-name')
  div(:last_name_div, :id => 'webform-component-your-details--your-details-wrapper--last-name')
  text_field(:your_address, :id => 'edit-submitted-your-details-your-details-wrapper-address')
  div(:your_address_div, :id => 'webform-component-your-details--your-details-wrapper--address')
  text_field(:city_town, :id => 'edit-submitted-your-details-your-details-wrapper-city-town')
  div(:city_town_div, :id => 'webform-component-your-details--your-details-wrapper--city-town')
  text_field(:postal_code, :id => 'edit-submitted-your-details-your-details-wrapper-postal-code')
  div(:postal_code_div, :id => 'webform-component-your-details--your-details-wrapper--postal-code')
  text_field(:email, :id => 'edit-submitted-your-details-your-details-wrapper-e-mail')
  div(:email_div, :id => 'webform-component-your-details--your-details-wrapper--e-mail')
  text_field(:phone, :id => 'edit-submitted-your-details-your-details-wrapper-phone')
  div(:phone_div, :id => 'webform-component-your-details--your-details-wrapper--phone')

  button(:next_button, :class => 'button next fullw-mobile')
  button(:submit_report, :id => 'edit-submit', :index => 0)

  $street_name = "Abbey Gardens"
  $street_details = "TEST DETAILS"
  $describe_problem = "TEST PROBLEM DESCRIBED"
  $first_name = "First Name Test"
  $last_name = "Last Name Test"
  $your_address = "Address Test"
  $city_town = "City Test"
  $postal_code = "Postal Code Test"
  $email = "email@example.com"
  $phone = "01234567890"

  def submit_damage_to_roads
    browser.wait_until { self.damage_to_road_element.exists? }
    puts "Selecting Damage to road"
    self.damage_to_road_element.click
    puts "Selecting Still report the issue"
    self.still_report_issue
    puts "Entering street name"
    self.address_of_problem_street = $street_name
    puts "Entering street details"
    self.address_of_problem_details = $street_details
    puts "Entering probmel descriptiuon"
    self.describe_problem = $describe_problem
    puts "Pressing next button"
    self.next_button
    sleep 1
    puts "Scrolling the page up"
    browser.div(:class => 'sp-head-wrap').send_keys :home
    sleep 1
    puts "Selecting Inside lane"
    self.inside_lane_element.click
    puts "selecting preferred contact"
    self.preferred_contact_none_element.click
    if browser.text.include?("First Name")
      puts "Completing cotact details"
      self.first_name = $first_name
      self.last_name = $last_name
      self.your_address = $your_address
      self.city_town = $city_town
      self.postal_code = $postal_code
      self.email = $email
      self.phone = $phone
    end
    puts "Submiting report"
    self.submit_report?.should == true
   # self.submit_report
  end

  def assert_confimation_message
    sleep 2
    browser.wait_until { self.back_button_element.exists? }
    browser.text.include?("Thanks for reporting!").should == true
  end


  def submit_advertising_and_trading
    self.a_boards_report_element.click
    self.a_board_street = $street_name
    self.a_board_street_number = $street_details
    self.a_board_details = $describe_problem
    self.next_button
    self.preferred_contact_none_element.click
    browser.text.include?("First Name").should == false
    self.submit_report?.should == true
    #self.submit_report
  end

  def check_field_validations_email
    browser.wait_until { self.submit_report_element.exists? }
    self.submit_report
    self.first_name_div.include?("This field cannot be empty.").should == true
    self.last_name_div.include?("This field cannot be empty.").should == true
    self.your_address_div.include?("This field cannot be empty.").should == true
    self.city_town_div.include?("This field cannot be empty.").should == true
    self.postal_code_div.include?("This field cannot be empty.").should == true
    if browser.text.include?("E-mail")
      self.email_div.include?("This field cannot be empty.").should == true
      self.email = "aaa zzz qqq"
      self.submit_report
      self.email_div.include?("Please provide us a correct email address. Ex: mail@address.domain").should == true
    else
      self.phone_div.include?("This field cannot be empty.").should == true
      self.phone = "aaa zzz qqq"
      self.submit_report
      self.phone_div.include?("UK telephone numbers should contain 10 or 11 digits").should == true
    end
  end
end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              