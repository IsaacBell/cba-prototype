source 'https://rubygems.org'
gem 'rails', '4.1.6'

# Base
#================================
gem 'sqlite3' # temp
gem 'puma' 	  # temp
#================================

# Utilities & APIs
#================================
gem 'spork'
gem 'twitter'
#================================

# Documentation
#================================
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc
#================================

# Assets
#================================
gem 'haml'
gem 'sass-rails', '>= 4.0.4'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '>= 4.0.0'
gem 'compass-rails'
# gem 'paperclip'
# gem 'aws-sdk'

gem 'jquery-rails'
# gem 'turbolinks'
#================================

group :development do
	# better_errors and binding_of_caller are MRI-compatible only
	gem 'quiet_assets'
	gem 'spring'
	gem 'better_errors'
	gem 'binding_of_caller'
	gem 'bullet'
	gem 'brakeman'
	gem 'guard'
	gem 'guard-rails'
	gem 'guard-sass', '>= 1.0.0', :require => false
	gem 'guard-coffeescript'
	gem 'guard-livereload'
end

group :test do
	gem 'database_cleaner'
	gem 'factory_girl_rails', '>= 4.0'
end

group :development, :test do
	gem 'rspec-rails'
	gem 'jasmine-rails'
  gem 'guard-rspec'
end

# group :production do
# end


