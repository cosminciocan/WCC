And(/^I navigate to a library form$/) do
  visit(LibrariesFormPage)
end

When(/^I select to submit the form without filling the fields$/) do
  on_page(CreateContentPage).save_content #The save_content locator has the same ID as the Submit button
end
