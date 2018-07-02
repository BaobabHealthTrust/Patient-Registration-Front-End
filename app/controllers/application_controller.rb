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
      handle_api_response response, status
    end

    def get_api_key
      return session[:api_key]
    end

    def set_api_key(api_key)
      session[:api_key] = api_key
    end

    def set_user(user)
      @logged_in_user = session[:user] = user
    end

  private
    def handle_api_response(response, status)
      if status == 403
        flash.now[:error] = 'Login required'
        render template: 'main/login', layout: 'form'
        return nil
      elsif status == 0 or status >= 300
        if response.nil? or status == 0 or status >= 500
          logger.error("Failed to communicate with API: #{response}")
          flash.now[:error] = 'Something awful occurred, please contact system admin'
        else
          flash.now[:error] = response['errors'].join '\n'
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
      if @logged_in_user.nil? or @logged_in_user.empty?
        redirect_to '/login'
        return false
      end
      return true
    end
end
