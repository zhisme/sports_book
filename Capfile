# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/scm/git'
require 'capistrano/deploy'
require 'capistrano/bundler'
require "capistrano/rails/assets"
require 'capistrano/rails/migrations'
require 'capistrano/rbenv'
require 'capistrano/puma'
require 'capistrano/file-permissions'

install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma

set :rbenv_type, :user
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /usr/bin/rbenv exec"
set :bundle_flags, '--deployment --local'

set :rbenv_map_bins, %w[rake gem bundle ruby rails]
set :rbenv_roles, :all # default value

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
