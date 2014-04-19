source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
gem 'pg', '~> 0.17.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'


group :development do
  gem 'thin', '~> 1.6.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  gem 'awesome_print'
  gem 'hirb' # When using console you get a nice table output when calling active recorde data
  gem 'wirble' # http://pablotron.org/software/wirble/
  gem 'better_errors' # https://github.com/charliesome/better_errors
  gem 'binding_of_caller'

  # Capistrano
  # gem 'capistrano', '3.0.1'
  # gem 'rvm-capistrano', '1.5.0'
  # gem 'capistrano-bundler'
  # gem 'capistrano-rvm'
  # gem 'capistrano-rails'
  
  gem 'quiet_assets' # Just removes all the noise from the console output when developing
  
  gem 'annotate', ">=2.6.0"
  
  # Code Metrics
  # THIS GEM IS CREATING PROBLEMS WITH MIGRATIONS like to error. https://github.rackspace.com/gist/bran0899/5449853
  # gem 'metric_fu', "~> 4.7.2" 
end

group :development, :test do  
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails', "~> 4.3.0"
  gem 'faker',  "~> 1.3.0" # Allows you to create fake data for factory girl to use. http://faker.rubyforge.org/
  gem 'shoulda-matchers', '~> 2.6.0'
  # Autotest Stuff
  gem "autotest", "~> 4.4.6"
  gem "autotest-standalone", "~> 4.5.11"
  gem "autotest-fsevent", "~> 0.2.9"
  gem "autotest-growl", "~> 0.2.16"
  
  # Tools
  # This is for terminal colors. It uses ANSI color system
  gem "colored" # url:http://rubydoc.info/gems/colored/1.2/frame
end
  

group :test do
  gem 'simplecov', require: false
  gem 'vcr', '~> 2.8.0'
  gem 'webmock', '~> 1.17.4'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', :require => false
  
  # Required for rake docs
  gem 'redcarpet', '~> 2.1.1'
  
end