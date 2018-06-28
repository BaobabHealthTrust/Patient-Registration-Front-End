class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session


    def api_get
        response, status = ApiClient.new(cookies['x-api-key']).get('/patients')
            
        if status == 403
            redirect controller: :users, action: :login
            return nil
        elsif status >= 300
            if response.nil?
                logger.error('Failed to communicate with API')
                flash[:error] = 'Something awful occurred'
            else
                flash[:error] = response['errors'].join '\n'
            return nil
        else
          return response
        end
    end

    def api_post(data)
        response, status = ApiClient.new(cookies['x-api-key']).post('/patients', 
         data   
        )
            
        if status == 403
            redirect controller: :users, action: :login
            return nil
        elsif status >= 300
            if response.nil?
                logger.error('Failed to communicate with API')
                flash[:error] = 'Something awful occurred'
            else
                flash[:error] = response['errors'].join '\n'
            return nil
        else
          return response
        end
    end

end
