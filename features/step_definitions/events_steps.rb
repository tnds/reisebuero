# Then
Then /^I should see the current month and year$/ do |text|
	page.should have_content(Time.now.strftime("%B %Y"))
end

