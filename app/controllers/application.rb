require_relative './base'
module Armadillo
  module Routes
    class ApplicationController < Base
      get '/' do
        redirect '/links'
      end
    end
  end
end
