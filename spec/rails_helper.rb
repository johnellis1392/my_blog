require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

# For cleaning database after use
require 'database_cleaner'
require 'pundit/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

# Configure shoulda matchers to run with rspec
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  # config.full_backtrace = true

  # Include factory girl into test suite
  config.include FactoryGirl::Syntax::Methods

  # Include json_helper module for request tests
  config.include RequestHelper, type: :request
  config.include RequestHelper, type: :controller
  config.include RequestHelper, type: :policy

  config.before(:suite) do
    # Clean database
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction

    # Clear unique value generator for Faker Factories
    Faker::UniqueGenerator.clear
    # Faker::Name.unique.clear # Clear only name generator
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
