namespace :heroku do
  desc 'copy config file' 
  task :init_config do
    `cp config/setting.yml.sample config/setting.yml`
    `cp config/initializers/secret_token.rb.example config/initializers/secret_token.rb`
  end
end
