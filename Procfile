web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV && rails db:migrate
worker_sidekiq: bundle exec sidekiq -C config/sidekiq.yml -e $RAILS_ENV
