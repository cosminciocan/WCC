class ReportItPage
  include PageObject

  page_url "#{EnvConfig['MEMBER_SITE_URL']}/report-it"

  #Roads and pavements
  link(:roads_and_pavements, :href => '/report-it-roads-and-pavements')
  div(:damage_to_road, :class => 'form-item form-type-radio form-item-submitted-roads-and-pavements-roads-and-pavements-subcategs')
  button(:still_report_issue, :class => 'button road-report-submit fullw-mobile')
  div(:inside_lane, :class => 'form-item form-type-radio form-item-submitted-roads-and-pavements-extra-information-where-is-it-where-on-the-road-surface-is-the-problem')
  div(:preferred_contact_none, :class => 'form-item form-type-radio form-item-submitted-your-details-preferred-contact-list')

  text_field(:address_of_problem_street, :id => 'edit-submitted-roads-and-pavements-extra-information-enter-address-of-problem-street')
  text_field(:address_of_problem_details, :id => 'edit-submitted-roads-and-pavements-extra-information-enter-address-of-problem-can-we-have-more-detail-please')
  text_field(:describe_problem, :id => 'edit-submitted-roads-and-pavements-extra-information-enter-address-of-problem-please-describe-the-problem')

  button(:next_button, :class => 'button next fullw-mobile ')

  button(:submit_button, :id => 'edit-submit')



end