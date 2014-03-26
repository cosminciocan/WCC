class EditContentPage < CreateContentPage
  include PageObject

  page_url ("#{EnvConfig['MEMBER_SITE_URL']}/admin/content")

  button(:save_smart_answer, :id => 'edit-submit')
  #Search fields
  text_field(:search_title, :id => 'edit-title')
  button(:apply_search, :id => 'edit-submit-admin-views-node')
  link(:edit_content, :xpath => '//td[8]/a')
  link(:delete_content, :xpath => '//a[2]')


  def verify_created_content
    self.content_title_yellow_bar.should == $page_title
    self.content_body_text.should == $page_body
  end

  def delete_created_content
    self.search_title = $page_title
    self.apply_search
    sleep 2
    while self.delete_content_element.exists?
      self.delete_content
      self.save_smart_answer
      browser.text.include?($page_title + " has been deleted.")
      puts "Content deleted"
      self.search_title = $page_title
      self.apply_search
      sleep 2
    end
  end

end