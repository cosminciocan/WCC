class CreateContentPage
  include PageObject

  page_url "#{EnvConfig['MEMBER_SITE_URL']}/node/add"

  link(:smart_answer, :href => '/node/add/wcc-sa')
  link(:quick_answer, :href => '/node/add/quick-answer')
  link(:news_feed, :href => '/node/add/news')

  button(:save_content, :id => 'edit-submit')

   #Creation fields:
  text_field(:title_field, :id => 'edit-title')
  select_list(:sa_type, :id => 'edit-wcc-sa-type-und')
  text_field(:body_field, :id => 'edit-body-und-0-value')
  link(:publishing_options, :text => /Publishing options/i)
  checkbox(:published, :id => 'edit-status')
  checkbox(:sticky_attribute, :id => 'edit-sticky')
    #Switch to plain text editor
  link(:disable_rich_text, :css => 'a#switch_edit-body-und-0-value')

  #S.A. Edit
  link(:sa_edit_tab, :text => 'S.A. Edit')
  text_field(:first_question_title, :class => 'wcc_sa_t wcc_sa_input')
  link(:add_new_option, :href => '#add-answer')
  text_field(:first_question_option1, :class => 'wcc_sa_a wcc_sa_input')
  radio_button(:first_question_option1_radio, :xpath => '//li/input')
  text_field(:second_question_title, :xpath => '//div[2]/div/input')
  radio_button(:second_question_option1_radio, :xpath => '//div[2]/div/div[2]/ul/li/input')
  text_field(:result_title, :xpath => '//div[3]/div/input')

  #Quick Answer page
  div(:content_title_yellow_bar, :class => 'sp-head')
  div(:content_body_text, :class => 'content sp-content ')

  $page_title = "AUTOMATION TITLE TEST"
  $page_body = "AUTOMATION BODY TEST"


  def create_content(content_type)
    browser.wait_until { self.disable_rich_text_element.exists?}
    self.title_field = $page_title
    self.disable_rich_text_element.focus
    self.disable_rich_text
    self.body_field = $page_body
    case content_type
      when "Standard Smart Answer" then standard_smart_answer
      when "News Feed" then newsfeed
    end
    self.save_content
    browser.text.include?($page_title + " has been created").should == true
    puts "Content Created!"
    case content_type
      when "Standard Smart Answer" then create_sa_body
    end
  end

  def standard_smart_answer
    browser.select_list(:id => 'edit-wcc-sa-type-und').options[1].select
  end

  def newsfeed
    self.publishing_options
    self.check_published
    self.check_sticky_attribute
  end

  def create_sa_body
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
    self.save_content
    #Selecting a date question
    browser.select_list(:class => 'wcc_sa_new_type').options[2].select
    browser.wait_until { self.second_question_title_element.exists?}
    self.second_question_title = "Second question (Date question)"
    self.select_second_question_option1_radio
    self.save_content
    #Adding a result
    browser.select_list(:class => 'wcc_sa_new_type').options[3].select
    browser.wait_until { self.result_title_element.exists? }
    self.result_title = "Result Title"
    self.save_content
    sleep 1
  end

end