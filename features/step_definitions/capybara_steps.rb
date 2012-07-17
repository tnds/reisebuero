# When
When /^I visit "(.*?)"$/ do |url|
	visit(send(url))
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
	fill_in field, :with => value
end

When /^I click on "(.*?)"$/ do |text|
  click_on text
end

When /^I click on element with id "(.*?)"$/ do |id|
	find("##{id}").click
end

When /^I select "(.*?)" from "(.*?)"$/ do |value, field|
  select(value, :from => field)
end

When /^I confirm the popup$/ do
	handle_js_confirm do
		click_on "OK"
	end
end

When /^I dismiss the popup$/ do
	handle_js_confirm do
		click_on "Cancel"
	end
end

#Then
Then /^I should see "(.*?)"$/ do |text|
	page.should have_content(text)
end

Then /^I should not see "(.*?)"$/ do |text|
	page.should_not have_content(text)
end

Then /^I should see the login form$/ do
  page.should have_xpath("//form[@id='new_user']")
end

Then /^the current path should be "(.*?)"$/ do |url|
  current_path.should == url
end

Then /^show me the page$/ do
  save_and_open_page
end