class PatientsController < ApplicationController
  def index
    @patients = api_get 'patients' 
  end

  def search
    if params['firstname'].nil? and params['lastname'].nil?
      render template: 'patients/search-form', layout: 'form' and return
    end
    
    @search_params = {firstname: params['firstname'], lastname: params['lastname']}
    @patients = api_post "patients/search", {
      firstname: params['firstname'],
      lastname: params['lastname']
    }
  end

  def edit
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
      flash[:error] = 'Failed to create patient (could not create related person)'
      return
    end
    
    patient = api_post '/patients', {person_id: person['id']}
    redirect_to "/patients/#{patient['id']}" unless patient.nil?
  end
  
  def show
    @patient = api_get "patients/#{params[:id]}"
  end

  def edit
    @patient = api_get "patients/#{params[:id]}"
  end

  def update
    @patient = api_post "patients/#{params[:id]}", params
    redirect_to :show, id: params[:id] unless @patient.nil?
  end

  def destroy
    # TODO: Send delete request to API
  end
end
