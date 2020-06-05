require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SongsController
use UsersController
use PlaylistsController
# use ArtistsController
# use GenresController
run ApplicationController
