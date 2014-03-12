class AdministratorLogin
  include PageObject
  include Users
  include Login


  page_url "#{EnvConfig['ADMIN_BASE_URL']}"

  text_field(:username_field, :id => 'edit-name')
  text_field(:password_field, :id => 'edit-pass')
  button(:login_button, :id => 'edit-submit')
  link(:logout_button, :href => '/user/logout')


  def login(user_type)
    user = get_user_info(user_type)
    self.username_field = user.username
    self.password_field = user.password
    self.login_button
    self.logout_button?.should == true
  end

end
