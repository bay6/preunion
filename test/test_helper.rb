<<<<<<< HEAD
ENV["RAILS_ENV"] ||= "test"
=======
ENV["RAILS_ENV"] = "test"
>>>>>>> 6c34f5b556a30b73cc3c34b721c23494660503c9
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
<<<<<<< HEAD
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
=======
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
>>>>>>> 6c34f5b556a30b73cc3c34b721c23494660503c9
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
