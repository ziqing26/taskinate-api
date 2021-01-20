class Api::V3::SessionsController < ApplicationController
    def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
        render json: { "logged_in": true }
    else
        render json: { "logged_in": false }
    end
    end
end