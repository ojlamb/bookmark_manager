require_relative './base'
module Armadillo
  module Routes
    class SessionController < Base
      get '/sessions/new' do
        erb :'sessions/new'
      end

      post '/sessions' do
        user = User.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          redirect to('/links')
        else
          flash.now[:errors] = ['The email or password is incorrect']
          erb :'seesions/new'
        end
      end

      delete '/sessions' do
        session.clear
        flash[:notice] = ['goodbye!']
      end
    end
  end
end
