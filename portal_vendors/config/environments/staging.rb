# frozen_string_literal: true

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  # config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  config.action_mailer.delivery_method = :smtp
  
  # config.action_mailer.smtp_settings = {
  #   address: 'nfi-mail-01',
  #   port: 25,
  #   domain: 'nutrifood',
  #   authentication: 'login',
  #   user_name: 'app.vms',
  #   password: 'aplikasinutrifood',
  #   enable_starttls_auto: true,
  #   openssl_verify_mode: 'none'
  # }
  
  config.action_mailer.smtp_settings = {
    address: 'nfi-mail-01.nutrifood.co.id',
    port: 25,
    domain: 'nutrifood.co.id',
    authentication: 'login',
    user_name: 'app.supplier',
    password: 'aplikasinutrifood',
    enable_starttls_auto: true,
    openssl_verify_mode: 'none'
  }

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_deliveries = true

  config.action_mailer.default_url_options = { host: 'baf-staging-x1', port: 9100 }

  config.secret_key_base = '30bd8dc139f6aa70f0847bfdf83a9cbc08c5ce03e37ee8eb318407fab14a8b43f35659ce82bdd57930cb365e3c561ba5b6080b80514b2f2d37b89f219738c635'
  config.require_master_key = true
  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
