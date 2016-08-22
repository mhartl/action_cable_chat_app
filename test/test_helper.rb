ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

# Returns the hash digest of the given string.
def digest(string)
  BCrypt::Password.create(string, cost: BCrypt::Engine::MIN_COST)
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
    !cookies['user_id'].empty?
  end
end

class ActionDispatch::IntegrationTest

  def login_as(user, password: "password")
    post login_url, params: { session: { username: user.username,
                                         password: password } }

  end
end