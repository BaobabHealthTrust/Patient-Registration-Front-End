require 'prs_api/api_client'

class UsersController < ApplicationController
  def index
    @users = api_get 'users'
  end

  def show
    @user = api_get "users/#{params[:id]}"
  end

  def edit
    @user = api_get "users/#{params[:id]}"
  end

  def update
    @user = api_post "users/#{params[:id]}", params
    render :show unless @user.nil?
  end

  def destroy
    # TODO: Send delete request to API
  end
end
