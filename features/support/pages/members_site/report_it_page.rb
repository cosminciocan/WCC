class ReportItPage
  include PageObject

  page_url "#{EnvConfig['MEMBER_SITE_URL']}/report-it"

  #Roads and pavements
  link(:roads_and_pavements, :href => '/report-it-roads-and-pavements')
  div(:damage_to_road, :class => 'form-item form-type-radio form-item-submitted-roads-and-pavements-roads-and-pavements-subcategs')
  button(:still_report_issue, :class => 'button road-report-submit fullw-mobile')
  div(:inside_lane, :class => 'form-item form-type-radio form-item-submitted-roads-and-pavements-extra-information-where-is-it-where-on-the-road-surface-is-the-problem')
  div(:preferred_contact_none, :class => 'form-item form-type-radio form-item-submitted-your-details-preferred-contact-list')
  text_field(:address_of_problem_street, :id => 'edit-submitted-roads-and-pavements-extra-information-enter-address-of-problem-street')
  text_field(:address_of_problem_details, :id => 'edit-submitted-roads-and-pavements-extra-information-enter-address-of-problem-can-we-have-more-detail-please')
  text_field(:describe_problem, :id => 'edit-submitted-roads-and-pavements-extra-information-enter-address-of-problem-please-describe-the-problem')

  #Your Details
  text_field(:first_name, :id => 'edit-submitted-your-details-your-details-wrapper-first-name')
  text_field(:last_name, :id => 'edit-submitted-your-details-your-details-wrapper-last-name')
  text_field(:your_address, :id => 'edit-submitted-your-details-your-details-wrapper-address')
  text_field(:city_town, :id => 'edit-submitted-your-details-your-details-wrapper-city-town')
  text_field(:postal_code, :id => 'edit-submitted-your-details-your-details-wrapper-postal-code')
  text_field(:email, :id => 'edit-submitted-your-details-your-details-wrapper-e-mail')
  text_field(:phone, :id => 'edit-submitted-your-details-your-details-wrapper-phone')

  button(:next_button, :class => 'button next fullw-mobile ')
  button(:submit_report, :id => 'edit-submit')


  def submit_damage_to_roads
    @street_name = "Abbey Gardens"
    @street_details = "TEST DETAILS"
    @describe_problem = "TEST PROBLEM DESCRIBED"
    @first_name = "First Name Test"
    @last_name = "Last Name Test"
    @your_address = "Address Test"
    @city_town = "City Test"
    @postal_code = "Postal Code Test"
    @email = "email@example.com"
    @phone = "01234567890"

#    browser.wait_until(self.damage_to_road?)
    puts "Select Damage to road"
    self.damage_to_road_element.click
    puts "Select still report the issue"
    self.still_report_issue
    puts "Enter street name"
    self.address_of_problem_street = @street_name
    puts "Enter street details"
    self.address_of_problem_details = @street_details
    puts "Enter probmel descriptiuon"
    self.describe_problem = @describe_problem
    puts "Press next button"
    self.next_button
    sleep 1
    puts "Scroll the page up"
    browser.div(:class => 'sp-head-wrap').send_keys :home
    sleep 1
    puts "Select Inside lane"
    self.inside_lane_element.click
    puts "selecting preferred contact"
    self.preferred_contact_none_element.click
    if browser.text.include?("First Name")
      puts "If action triggered"
      self.first_name = @first_name
      self.last_name = @last_name
      self.your_address = @your_address
      self.city_town = @city_town
      self.postal_code = @postal_code
      self.email = @email
      self.phone = @phone
    end
    puts "Submit button"
    self.submit_report
  end

end