source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.3.4'
gem 'rails', '~> 5.2.0'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5.1', '>= 5.1.1'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem "paperclip", "~> 6.0.0"
gem 'jasny-bootstrap-rails'
gem 'jquery-ui-rails'
gem 'jquery-rails'
gem 'popper_js', '~> 1.12.9'
gem 'jquery-turbolinks'
gem "font-awesome-rails"
gem "pundit"
gem 'roo'
gem 'aws-sdk'
gem 'emoji'
gem 'csv'
gem 'pg_search'
gem 'warden'
gem 'fullcalendar-rails'
gem 'momentjs-rails'
gem 'bootstrap-daterangepicker-rails'
gem 'ice_cube'
gem 'simple_form'
gem 'therubyracer'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'sprockets', '~> 4.0.0.beta1'
gem "twitter-bootstrap-rails"
gem 'httparty', '~> 0.16.2'
gem 'twilio-ruby'
gem 'delayed_job_active_record'
gem 'daemons'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'devise_invitable'
gem 'high_voltage'
gem 'unicorn'
gem 'unicorn-rails'
group :development do
  gem 'better_errors'
  gem 'foreman'
  gem 'hub', :require=>nil
  gem 'rails_layout'
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end
group :test do
  gem 'database_cleaner'
  gem 'launchy'
end
source 'https://rails-assets.org' do
  gem 'rails-assets-fullcalendar'
  gem 'rails-assets-momentjs'

end
