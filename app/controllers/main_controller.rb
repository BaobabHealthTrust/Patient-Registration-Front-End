require 'prs_api/api_client'

class MainController < ApplicationController
  layout :resolve_layout

  def login
    # render template: 'main/index', layout: 'application'
    # puts "username: #{params[:username]}"

    response = api_post('login', {
      username: params[:username], password: params[:password]
    })

    unless response.nil?
      set_api_key response['api-key']
      set_user response['user']
      render template: 'main/index', layout: 'application'
    end
  end

  def check_login
    user = api_get('login')
    unless user.nil?
      set_user user
      render template: 'main/index', layout: 'application' unless response.nil?
    end
  end

  def logout
    api_get('logout')
    set_api_key nil
    set_user nil
    redirect_to :login
  end

  private

  def resolve_layout
    case action_name
    when 'login'
      'form'
    else
      'application'
    end
  end
end
