# config/deploy/local-procution.rb
server 'localhost', user: 'rails', roles: %i(web app)
 
set :stage, :production
set :unicorn_rack_env, "production"
set :branch, 'master'
set :rails_env, 'production'

