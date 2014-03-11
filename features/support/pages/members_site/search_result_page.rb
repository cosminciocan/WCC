class SearchResultPage
  include PageObject


   text_field(:search_field, :id => 'edit-keys')
   ordered_list(:results, :class => 'search-results apachesolr_search-results')
   div(:mandatory_error_message, :class => 'messages error icon-error')

end