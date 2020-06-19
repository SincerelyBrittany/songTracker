require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SongsController
use UsersController
use PlaylistsController
use SessionsController
# use ArtistsController
# use GenresController
run ApplicationController
#
# # require './app.rb'
# require 'rack/jekyll'
# require 'rubygems'
# require 'bundler'
#
# run Rack::Jekyll.new
#
# set :public_folder, 'public'
# set :static, true
#
# use Rack::MethodOverride
# use SongsController
# use UsersController
# use PlaylistsController
# use SessionsController
# # use ArtistsController
# # use GenresController
# run ApplicationController
