Given /^I am not logged in$/ do
  visit("/users/sign_out")
end

Given /I am logged in as "(.*?)"/ do |role|
  steps %{
		Given a #{role} exists with a username of "dummy"
		When I visit "root_path"
		And I click on "Anmelden"
		And I fill in "user_username" with "dummy"
		And I fill in "user_password" with "123456"
		And I click on "Sign in"
  }
end