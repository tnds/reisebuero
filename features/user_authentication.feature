Feature: User Authentication
	In order to keep my assets private
	As a paranoid nerd
	I want to have some user authentication
		
	Scenario: Sign up
		Given I am not logged in
		When I visit "root_path"
		And I click on "Registrieren"
		And I fill in "user_username" with "dummy"
		And I fill in "user_email" with "dummy@example.com"
		And I fill in "user_password" with "123456"
		And I fill in "user_password_confirmation" with "123456"
		And I click on "Sign up"
		Then I should see "Die Registrierung war erfolgreich"
		And the current path should be "/"
		
	Scenario: Log in
		Given a user exists with a username of "dummy"
		When I visit "root_path"
		And I click on "Anmelden"
		And I fill in "user_username" with "dummy"
		And I fill in "user_password" with "123456"
		And I click on "Sign in"
		Then I should see "Anmeldung erfolgreich."
		And the current path should be "/"

	Scenario: Log out
		Given I am logged in as "user"
		When I visit "root_path"
		And I click on "Abmelden"
		Then I should see "Abmeldung erfolgreich."
		
	Scenario: Log in with wrong user information
		Given a user exists with a username of "dummy"
		When I visit "root_path"
		And I click on "Anmelden"
		And I fill in "user_username" with "dummy"
		And I fill in "user_password" with "wrong_password"
		And I click on "Sign in"
		Then I should see "Benutzername oder Passwort ungültig."
		And the current path should be "/users/sign_in"
