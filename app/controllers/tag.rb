require_relative './base'
module Armadillo
  module Routes
    class TagController < Base
      get '/tags/:name' do
        tag = Tag.first(name: params[:name])
        @links = tag ? tag.links : []
        erb :'links/index'
      end
    end
  end
end
