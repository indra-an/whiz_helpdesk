source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Cores
gem 'rails', '~> 5.1.1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'

# Assets
gem "jquery-rails"
gem 'turbolinks', '~> 5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem "bootstrap-sass", "~> 3.3.7"
gem "font-awesome-sass", "~> 4.7.0"
gem 'cocoon', '~> 1.2', '>= 1.2.10'
gem 'growlyflash', '~> 0.9.2'

# Authentications / Authorization
gem "bcrypt", "~> 3.1.7"
gem 'devise', '~> 4.3'
gem 'cancancan', '~> 2.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Views
gem "slim", "~> 3.0", ">= 3.0.7"
gem 'slim-rails', '3.1.1'
gem 'simple_form', '~> 3.5'
gem "jbuilder", "~> 2.5"
gem 'ckeditor', '~> 4.2', '>= 4.2.3'
# gem "wysiwyg-rails"
gem "bootstrap-wysihtml5-rails", "~> 0.3.3.8"

#upload files
gem 'paperclip', '~> 5.1'

# Pagination
gem 'kaminari', '~> 1.0', '>= 1.0.1'

#Other
gem 'dalli', '~> 2.7', '>= 2.7.6'
gem 'audited', '~> 4.4', '>= 4.4.1'
gem 'therubyracer', platforms: :ruby

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem "better_errors"
  gem "binding_of_caller"
  gem "annotate"
  gem "bullet"

  # this is a small gem which causes rails console to open pry
  gem "pry-rails"

  # an IRB alternative and runtime developer console
  gem "pry"

  # a code metric tool to check the quality of rails code
  gem "rails_best_practices"

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
