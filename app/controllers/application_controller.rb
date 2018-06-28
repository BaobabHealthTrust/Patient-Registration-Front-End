require 'prs_api/api_client'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  protected
    def api_get(resource)
      response, status = ApiClient.new(cookies['x-api-key']).get(resource)
      handle_api_response response, status
    end

    def api_post(resource, data)
      response, status = ApiClient.new(cookies['x-api-key']).post(resource, data)
      handle_api_response resource, data
    end

  private
    def handle_api_response(response, status)
      if status == 403
        redirect controller: :users, action: :login
        nil
      elsif status >= 300
        if response.nil?
          logger.error('Failed to communicate with API')
          flash[:error] = 'Something awful occurred'
        else
          flash[:error] = response['errors'].join '\n'
        end
        nil
      else
        # Have a 2XX status meaning success however make sure
        # that response returned is never nil (this flags an error here)
        response or {}
      end
    end
end
