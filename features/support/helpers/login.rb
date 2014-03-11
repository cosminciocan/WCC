module Login
  include PageObject
  include Users


  def get_user_info(user_type)
    case user_type
      when "valid Administrator" then ValidAdministrator
      else raise "No such User exists!"
    end
  end

end
