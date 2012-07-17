FactoryGirl.define do
	factory :user do
		sequence(:username) {|n| "user#{n}"}
		sequence(:email) {|n| "user#{n}@example.com"}
		association :role, factory: :user_role
		password "123456"
		factory :admin do
	 			association :role, factory: :admin_role
		end
		factory :moderator do
 			association :role, factory: :moderator_role
		end
	end
	
	factory :role do
		factory :admin_role do
			name "admin"
		end
		
		factory :moderator_role do
			name "moderator"
		end
		
		factory :user_role do
			name "user"
		end
	end
end
