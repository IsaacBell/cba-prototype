RSpec.configure do |config|
  require 'spork'
  require 'factory_girl_rails'

  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
    ensure
      DatabaseCleaner.DatabaseClean
    end
  end

  Spork.prefork do
   
    require "rails/application"
    Spork.trap_method(Rails::Application, :reload_routes!)
   
    require File.expand_path("../../config/environment", __FILE__)
    require 'rspec/rails'
   
    Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
   
    RSpec.configure do |config|
      config.mock_with :mocha
      config.use_transactional_fixtures = true
      config.include Devise::TestHelpers, :type => :controller
      config.include KoalaHelpers
    end
   
  end
 
  Spork.each_run do
    require 'factory_girl_rails'
  end

end
