ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure(&:block_unknown_urls)

module Features
  include Formulaic::Dsl
  include SelectDateHelpers
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false

  config.include Features, type: :feature
  #
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
