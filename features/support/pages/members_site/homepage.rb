class Homepage
  include PageObject


  page_url "#{EnvConfig['MEMBER_SITE_URL']}"

  text_field(:search_field, :id => 'edit-search-block-form--2')
  button(:search_button, :id => 'edit-submit')
  div(:autocomplete_suggestion_box, :class => 'apachesolr_autocomplete suggestion')


  def wait_for_suggestion_box
    browser.wait_until { self.autocomplete_suggestion_box_element.exists? }
  end

end