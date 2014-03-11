class PreApplicationAdvicePage
  include PageObject

  page_url "#{EnvConfig['MEMBER_SITE_URL']}/pre-application-advice-form"

  #First step Page
  text_field(:postcode_field, :id => 'edit-postcode')
  button(:find_address_button, :id => 'postcode-lookup-button')
  label(:select_address_label, :id => 'postcode-address-list')
  button(:next_step_button, :id => 'file_upload_step_submit')

  #Second step Page
  text_field(:describe_field, :id => 'edit-description')

  #Third step Page
  button(:submit_app_button, :id => 'edit-finish')
    #Paying on behalf of the client?
  radio_button(:not_paying_for_pre_app, :id => 'edit-paying-option-q-n')
  radio_button(:paying_for_pre_app, :id => 'edit-paying-option-q-y')
    #Are the billing details the same as the contact details?
  radio_button(:same_details, :id => 'edit-billing-details-q-y')
  radio_button(:not_same_details, :id => 'edit-billing-details-q-n')
    #Contact details
  text_field(:contact_name, :id => 'edit-contact-name')
  text_field(:contact_postcode , :id => 'edit-contact-postcode')
  text_field(:contact_address , :id => 'edit-contact-address1')
  text_field(:contact_phone , :id => 'edit-contact-phone')
  text_field(:contact_email , :id => 'edit-contact-email')
    #Billing details
  text_field(:billing_name , :id => 'edit-agent-billing-details-agent-billing-name')
  text_field(:billing_address , :id => 'edit-agent-billing-details-agent-billing-address1')
  text_field(:billing_postcode , :id => 'edit-agent-billing-details-agent-billing-postcode')
  text_field(:billing_phone , :id => 'edit-agent-billing-details-agent-billing-phone')
  text_field(:billing_email , :id => 'edit-agent-billing-details-agent-billing-email')



  def select_address
    browser.wait_until { !browser.text.include?('Please wait') }
    browser.select_list(:id => 'postcode-address-list').options[1].select
  end

  def set_contact_details
    self.contact_name = "TEST Contact Name"
    self.contact_postcode = "TEST Contact Postcode"
    self.contact_address = "TEST Contact Address"
    self.contact_phone = "01234567890"
    self.contact_email = "test@test.test"
  end

  def set_billing_details
    self.billing_name = "TEST Billing Name"
    self.billing_address = "TEST Billing Address"
    self.billing_postcode= "TEST Billing Postcode"
    self.billing_phone = "TEST Billing Phone"
    self.billing_email = "TEST Billing Email"
  end

end