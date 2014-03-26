class PlanningCollectionPage
  include PageObject


  page_url ("#{EnvConfig['MEMBER_SITE_URL']}/planning")

  div(:first_collection, :class => 'sticky views-row views-row-1 views-row-odd views-row-first')
  div(:second_collection, :class => 'sticky views-row views-row-2 views-row-even')
  div(:third_collection, :class => 'sticky views-row views-row-3 views-row-odd')
  div(:fourth_collection, :class => 'sticky views-row views-row-4 views-row-even')
  div(:fifth_collection, :class => 'sticky views-row views-row-5 views-row-odd')
  div(:sixth_collection, :class => 'sticky views-row views-row-6 views-row-even')


   #First item in collection page link
  link(:first_relevant_link, :xpath => '//div[2]/div/ul/li/a')
  link(:second_relevant_link, :xpath => '//div[2]/div/ul/li[2]/a')
  link(:third_relevant_link, :xpath => '//div[2]/div/ul/li[3]/a')
  link(:fourth_relevant_link, :xpath => '//div[2]/div/ul/li[4]/a')
  link(:fifth_relevant_link, :xpath => '//li[5]/a')


end