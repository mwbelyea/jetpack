# frozen_string_literal: true
Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass
  config.assets.compile = false
  config.force_ssl = true
  config.log_level = :debug
  config.log_tags = [:request_id]

  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = false

  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.middleware.use Rack::Deflater
  config.active_record.dump_schema_after_migration = false
end
