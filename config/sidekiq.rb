# frozen_string_literal: true

# We set the redis server size to X,  for each of the Sidekiq worker threads and 2 additional for Sidekiq’s internal use.
# 2 matches the value we set for production concurrency in the Sidekiq config file config/sidekiq.yml.
# Whenever you change the production concurrency value, make sure to keep a +2 buffer value for Sidekiq redis config server value above
Sidekiq.configure_server do |config|
  config.redis = { url: ENV['SIDEKIQ_REDIS_URL'], network_timeout: 5 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['SIDEKIQ_REDIS_URL'], network_timeout: 5 }
end

Sidekiq::Extensions.enable_delay!
