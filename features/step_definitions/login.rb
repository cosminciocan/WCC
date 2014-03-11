Given /^I login (?:as|with) (.*) user$/ do |user_type|
  if "valid administrator" then visit(AdministratorLogin).login(user_type)
  else puts "Invalid user type supplied"
  end

end