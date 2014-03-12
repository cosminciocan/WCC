class ClearCachePage
  include PageObject

  page_url "#{EnvConfig['MEMBER_SITE_URL']}/admin/config/development/performance"

  button(:clear_cache_button, :id => 'edit-clear')

end