require 'prs_api/api_client'

class MainController < ApplicationController
  def login
    # render template: 'main/index', layout: 'application'
    # puts "username: #{params[:username]}"
    response, status = ApiClient.new().post('/login', {
      username: params[:username], password: params[:password]
    })

    if status == 200
      set_api_key response['api-key']
      set_user response['user']
      render template: 'main/index', layout: 'application'
    else
      flash[:error] = response['errors'].join '\n'
      render template: 'main/login',  layout: 'form', status: status
    end
  end

  def check_login
    response = api_get('login')
    render template: 'main/index', layout: 'application' unless response.nil?
  end
end
