require 'prs_api/api_client'

class ApplicationController < ActionController::Base
  protect_from_forgery

  skip_before_action :verify_authenticity_token
  before_action :load_user

  protected
    def api_get(resource)
      response, status = ApiClient.new(get_api_key).get(resource)
      handle_api_response response, status
    end

    def api_post(resource, data)
      response, status = ApiClient.new(get_api_key).post(resource, data)
      handle_api_response resource, data
    end

    def get_api_key
      return session[:api_key]
    end

    def set_api_key(api_key)
      session[:api_key] = api_key
    end

    def set_user(user)
      session[:user] = user
      load_user
    end

  private
    def handle_api_response(response, status)
      if status == 403
        render template: 'main/login', layout: 'form'
        return nil
      elsif status >= 300
        if response.nil?
          logger.error('Failed to communicate with API')
          flash[:error] = 'Something awful occurred'
        else
          flash[:error] = response['errors'].join '\n'
        end
        return nil
      else
        # Have a 2XX status meaning success however make sure
        # that response returned is never nil (this flags an error here)
        return (response or {})
      end
    end

    # Loads logged in user from session.
    #
    # As a side effect/result method sets @logged_in_user
    def load_user
      @logged_in_user = session[:user]
    end
end
