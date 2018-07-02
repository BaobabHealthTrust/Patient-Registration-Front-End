class MainController < ApplicationController
  layout :resolve_layout
  skip_before_action :load_user

  def login
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
    if user
      set_user user
      render template: 'main/index', layout: 'application'
    end
  end


  def reports
    user = api_get('login')
    if user
      set_user user
        @reports = api_get 'count'
      render template: 'main/reports', layout: 'application'
    end
  end
  def logout
    api_post('logout', {})
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
