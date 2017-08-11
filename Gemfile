source 'https://rubygems.org'

# List of awesome gems to incorporate into an application:
# http://www.rubyonrails365.com/7-must-have-gems-to-install-on-any-project/
#
# More Awesome Gems:
# https://infinum.co/the-capsized-eight/top-8-tools-for-ruby-on-rails-code-optimization-and-cleanup
#
# Production Rails App Information:
# http://www.akitaonrails.com/2016/03/22/is-your-rails-app-ready-for-production
# https://www.railsspeed.com/
# https://www.speedshop.co/2015/07/15/the-complete-guide-to-rails-caching.html
# https://collectiveidea.com/blog/archives/2015/02/19/optimizing-rails-for-memory-usage-part-1-before-you-optimize
# https://www.airpair.com/ruby-on-rails/performance
# https://stackoverflow.com/questions/8022554/rails-performance-tuning-for-production
# https://hackhands.com/ruby-rails-performance-tuning/
# https://pragprog.com/book/adrpo/ruby-performance-optimization
# https://www.digitalocean.com/community/tutorials/a-comparison-of-rack-web-servers-for-ruby-web-applications
#
# ActionCable Overview:
# http://edgeguides.rubyonrails.org/action_cable_overview.html
#
# Why ActionCable (websockets):
# https://www.speedshop.co/2015/09/30/action-cable.html
#
# HTTP2 Gems:
# https://rubygems.org/gems/http2/versions/0.0.32
# https://github.com/igrigorik/http-2
#
# OpenSSL Module (ruby):
# http://ruby-doc.org/stdlib-2.0.0/libdoc/openssl/rdoc/OpenSSL.html
#
# OpenSSL Gem (rails):
# https://github.com/ruby/openssl
#
# Ember with Rails:
# https://wyeworks.com/blog/2015/6/30/how-to-build-a-rails-5-api-only-and-ember-application
# https://www.airpair.com/ember.js/posts/top-mistakes-ember-rails
# https://emberigniter.com/modern-bridge-ember-and-rails-5-with-json-api/

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails'
gem 'pg'
gem 'puma'
# gem 'redis'
gem 'redis-rails'
gem 'pundit'
gem 'omniauth'
gem 'openssl'
gem 'active_model_serializers'

gem 'tzinfo-data', platforms: :ruby

group :development, :test do
  gem 'byebug', platforms: :ruby
  gem 'rspec-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'database_cleaner'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'

  # Live-Reload server:
  # https://github.com/guard/guard-livereload
  # Use 'guard init livereload' to initialize Live-Reload server in rails.
  # 'require: false' means gem is not automatically required.
  gem 'guard-livereload', require: false

  # Awesome-Print for better printing:
  # https://github.com/awesome-print/awesome_print
  # The 'require' option here specifies a require alias.
  # gem 'awesome_print', require: 'ap'

  # Meta-Request for debugging rails in chrome:
  # https://github.com/qqshfox/meta_request
  # ALso needs to install 'Rails Panel' Chrome extension.
  # gem 'meta_request'

  # Peek for performance monitoring:
  # https://github.com/peek/peek
  # gem 'peek'

  # Better-Errors for a more descriptive error page:
  # https://github.com/charliesome/better_errors
  # gem 'better_errors'
  # gem 'binding_of_caller' # Optional: For advanced better_errors features

  # Pry for live debugging:
  # https://github.com/rweng/pry-rails
  # gem 'pry-rails'

  # Quiet-Assets for stopping printing asset requests:
  # https://github.com/evrone/quiet_assets
  # gem 'quiet_assets'

  # Bullet for monitoring ActiveRecord queries for N+1 queries?
  # https://github.com/flyerhzm/bullet
  # gem 'bullet'

  # Newrelic RPM for monitoring query speed:
  # https://github.com/newrelic/rpm
  # gem 'newrelic_rpm'

end
