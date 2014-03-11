Given /^I create (?:as|a) (.*) content type$/ do |content_type|
  case content_type
    when "Standard Smart Answer" then visit(CreateContentPage).create_standard_smart_answer
      when "Calculated Smart Answer" then visit(CreateContentPage)
  end
end