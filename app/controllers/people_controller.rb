class PeopleController < ApplicationController
  def show
    @person = api_get "people/#{params[:id]}"
    render layout: 'application' unless @person.nil?
  end

  def edit
    @person = api_get "people/#{params[:id]}"
    render layout: 'form' unless @person.nil?
  end

  def update
    @person = api_post "people/#{params[:id]}", {
      "firstname": params[:firstname],
      "lastname": params[:lastname],
      "birthdate": params[:birthdate],
      "gender": params[:gender]
    }
    redirect_to "/people/#{@person['id']}" unless @person.nil?
  end
end