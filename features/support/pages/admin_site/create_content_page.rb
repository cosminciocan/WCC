class CreateContentPage
  include PageObject

  page_url "#{EnvConfig['MEMBER_SITE_URL']}/node/add"

  link(:smart_answer, :href => '/node/add/wcc-sa')

  button(:save_content, :id => 'edit-submit')

   #Smart Answer (sa) creation fields:
  text_field(:sa_title, :id => 'edit-title')
  select_list(:sa_type, :id => 'edit-wcc-sa-type-und')


  def create_standard_smart_answer
    self.smart_answer
    browser.text.include?("Enter the Smart Answer title, description and type").should == true
    self.sa_title = "SMART ANSWER TITLE"
    browser.select_list(:id => 'edit-wcc-sa-type-und').options[1].select
   # self.sa_type.options[1].select
    self.save_content
    browser.text.include?("Smart Answer SMART ANSWER TITLE has been created")
  end

end