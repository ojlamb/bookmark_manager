require 'data_mapper'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative './controllers/set_controller'

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
