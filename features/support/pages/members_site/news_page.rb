class NewsPage
  include PageObject


  page_url ("#{EnvConfig['MEMBER_SITE_URL']}/news")

  div(:collections_on_page, :class => 'featured-sections')

end