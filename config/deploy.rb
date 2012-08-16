require 'bundler/capistrano'
require 'rvm/capistrano'

set :application, "reisebuero"
set :repository,  "git@github.com:telepath/reisebuero.git"

set :branch,          "master"
set :migrate_target,  :current
set :scm, :git
set :ssh_options,     { :forward_agent => true }
set :rails_env,       "production"
set :deploy_to,       "/home/deployer/apps/reisebuero"
set :deploy_via, 			:remote_cache
set :user,            "deployer"
set :use_sudo,				false
set :bundle_without, [:development, :test]
set :port, 4000

set :rvm_ruby_string, "1.9.3"
set :rvm_type, :system

server "localhost", :web, :app, :db, primary: true

before "deploy:assets:precompile", "config:symlink"
after "deploy", "deploy:cleanup"
after "deploy:cleanup", "deploy:migrate"

require 'capistrano-unicorn'

namespace :config do
  desc "Symlink shared stuff"
  task :symlink, :server => :app do
    run "ln -nfs #{shared_path}/database.yml #{latest_release}/config/database.yml"
  end
end
