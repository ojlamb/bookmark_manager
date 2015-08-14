require_relative './base'

module Armadillo
  module Routes
    class LinkController < Base
      get '/links' do
        @links = Link.all
        erb :'/links/index'
      end

      get '/links/new' do
        erb :'links/new'
      end

      post '/links' do
        link = Link.new(url: params[:url], title: params[:title])
        params[:tag].split(' ').each do |t|
          tag = Tag.create(name: t)
          link.tags << tag
        end
        link.save
        redirect '/links'
      end
    end
  end
end
