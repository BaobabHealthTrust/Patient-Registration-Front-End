class UsersController < ApplicationController
  def index
    @users = api_get 'users'
  end

  def new
    @firstname = params[:firstname] or ''
    @lastname = params[:lastname] or ''

    render 'layout': 'form'
  end

  def create
    person = api_post '/people', {
      "firstname": params[:firstname],
      "lastname": params[:lastname],
      "birthdate": params[:birthdate],
      "gender": params[:gender]
    }

    if person.nil?
      flash[:error] = 'Failed to create user (could not create related person)'
      return
    end
    
    user = api_post '/users', {person_id: person['id']}
    redirect_to users_path(id: params[:id]) unless user.nil?
  end
  
  def show
    @user = api_get "users/#{params[:id]}"
  end

  def edit
    @user = api_get "users/#{params[:id]}"
  end

  def update
    @user = api_post "users/#{params[:id]}", params
    redirect_to :show, id: params[:id] unless @user.nil?
  end

  def destroy
    response = api_delete "users/#{params[:id]}", params
    redirect_to users_path if response
  end
end
