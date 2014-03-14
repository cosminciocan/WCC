class SmartAnswerPage
  include PageObject


  page_url("#{EnvConfig['MEMBER_SITE_URL']}/smart-answer-title-test")


  span(:first_question_title, :class => 'wcc_sa_title')
  label(:first_question_option1_title, :xpath => '//li/label')
  radio_button(:first_option, :name => 'response')
  button(:next_button, :class => 'medium button')
  span(:second_question_title, :xpath => '//li[2]/h3/span[2]')
  text_field(:second_question_date_picker, :class => 'wcc_sa_date hasDatepicker')
  div(:result_title, :class => 'wcc_sa_result')
  link(:date_pick, :css => 'a.ui-state-default.ui-state-hover')


  def complete_smart_answer
    self.first_question_title.include?("First question").should == true
    self.first_question_option1_title.include?("First question option 1").should == true
    self.select_first_option
    self.next_button
    self.second_question_title.include?("Second question (Date question)").should == true
    #self.second_question_date_picker_element.click
    browser.text_field(:class => 'wcc_sa_date hasDatepicker').click
    self.date_pick
    self.next_button
  end

end