require 'data_mapper'
require 'dm-core'
require 'dm-migrations'


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{env}") # FOR PRODUCTION ENV -HEROKU DEPLOYMENT
#DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

require './app/models/link'
require './app/models/tag'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!
