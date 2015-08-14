require 'data_mapper'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative './controllers/base.rb'
require_relative './controllers/application.rb'
require_relative './controllers/link.rb'
require_relative './controllers/session.rb'
require_relative './controllers/tag.rb'
require_relative './controllers/user.rb'

module Armadillo
  class BookMarkManager < Sinatra::Base
    
    use Routes::LinkController
    use Routes::UserController
    use Routes::SessionController
    use Routes::TagController
    use Routes::ApplicationController

    run! if app_file == $0
  end
end
