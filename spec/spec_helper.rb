# We want the RAILS_ENV to be test, regardless of what it is
# defined as. The reason for this explicit override is because
# our tests will utilize the database as well and we do not want
# to mix test data with development.
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'

include Warden::Test::Helpers
Warden.test_mode!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.include Devise::TestHelpers, :type => :controller
end
