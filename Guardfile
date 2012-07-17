# A sample Guardfile
# More info at https://github.com/guard/guard#readme

group :cucumber do
	guard 'cucumber' do
	  watch(%r{^features/.+\.feature$})
	  watch(%r{^features/support/.+$})          { 'features' }
	  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
		watch('spec/factories/*.rb')
		
		# Rails example
	  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
	  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
	  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
	  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
	  watch('config/routes.rb')                           { "spec/routing" }
	  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  
	  # Capybara request specs
	  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
	end
end

notification :off
group "frontend" do
	guard 'livereload' do
	  watch(%r{app/views/.+\.(erb|haml|slim)})
	  watch(%r{app/helpers/.+\.rb})
	  watch(%r{public/.+\.(css|js|html)})
	  watch(%r{config/locales/.+\.yml})
	  # Rails Assets Pipeline
	  watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
	end
end