class EditContentPage
  include PageObject

  page_url ("#{EnvConfig['MEMBER_SITE_URL']}/admin/content")

  button(:save_smart_answer, :id => 'edit-submit')
  #Search fields
  text_field(:search_title, :id => 'edit-title')
  button(:apply_search, :id => 'edit-submit-admin-views-node')
  link(:edit_content, :xpath => '//td[8]/a')
  link(:delete_content, :xpath => '//a[2]')

  #S.A. Edit
  link(:sa_edit_tab, :xpath => '//li[3]/a')
  text_field(:first_question_title, :xpath => '//input')
  link(:add_new_option, :href => '#add-answer')
  text_field(:first_question_option1, :class => 'wcc_sa_a wcc_sa_input')
  radio_button(:first_question_option1_radio, :xpath => '//li/input')
  text_field(:second_question_title, :xpath => '//div[2]/div/input')
  radio_button(:second_question_option1_radio, :xpath => '//div[2]/div/div[2]/ul/li/input')
  text_field(:result_title, :xpath => '//div[3]/div/input')


  def create_sa_body
    self.search_title = 'SMART ANSWER TITLE TEST'
    self.apply_search
    sleep 2
    self.edit_content
    #Selecting a multiple choice question
    self.sa_edit_tab
    browser.select_list(:class => 'wcc_sa_new_type').options[1].select
    browser.wait_until { self.first_question_title_element.exists? }
    self.first_question_title = "First question"
    self.add_new_option
    browser.wait_until { self.first_question_option1_element.exists? }
    self.first_question_option1 = "First question option 1"
    self.select_first_question_option1_radio
    browser.wait_until { browser.text.include?("The selected option does not have a connected node")}
    self.save_smart_answer
    #Selecting a date question
    browser.select_list(:class => 'wcc_sa_new_type').options[2].select
    browser.wait_until { self.second_question_title_element.exists?}
    self.second_question_title = "Second question (Date question)"
    self.select_second_question_option1_radio
    self.save_smart_answer
    #Adding a result
    browser.select_list(:class => 'wcc_sa_new_type').options[3].select
    browser.wait_until { self.result_title_element.exists? }
    self.result_title = "Result Title"
    self.save_smart_answer
    sleep 1
  end
end