Given /^I login (?:as|with) (.*) user$/ do |user_type|
  case user_type
    when "valid Administrator" then visit(AdministratorLogin).login(user_type)
      else puts "Invalid user type suplied!"
  end
end