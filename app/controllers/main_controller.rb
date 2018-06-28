require 'prs_api/api_client'

class MainController < ApplicationController
  def login
    # render template: 'main/index', layout: 'application'
    puts "username: #{params[:username]}"
    response, status = ApiClient.new().post('/login', {
      username: params[:username], password: params[:password]
    })

    if status == 200
      cookies['x-api-key'] = response['api-key']
      @user = session['user'] = response['user']
      render template: 'main/index', layout: 'application'
    else
      flash[:error] = response['errors'].join '\n'
      render template: 'main/login',  layout: 'form', status: status
    end
  end

  def check_login
    api_key = cookies['x-api-key']
    if api_key.nil?
      render template: 'main/login', layout: 'form'
      return
    end

    response = ApiClient.new(api_key).get('/login')
    if response.nil?
      render template: 'main/login', layout: 'form'
      return
    end

    render json: @response
  end
end
