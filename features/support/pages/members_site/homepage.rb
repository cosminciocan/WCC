class Homepage
  include PageObject


  page_url "#{EnvConfig['MEMBER_SITE_URL']}"

  text_field(:search_field, :xpath => '//div[4]/div/div/div/div/div/div/div/form/div/div/div/input')
  button(:search_button, :css => 'div.region.region-search-box > div.region.region-search-box > #block-search-form > div.content > #search-block-form > div > div.container-inline > #edit-actions > #edit-submit')
  div(:autocomplete_suggestion_box, :class => 'apachesolr_autocomplete suggestion')


  def wait_for_suggestion_box
    browser.wait_until { self.autocomplete_suggestion_box_element.exists? }
  end

end