class PeopleController < ApplicationController
  def index
    # HACK: A fix for an error that occurs when a user chooses to
    # cancel a person edit operation. Clicking on cancel in a touchtoolkit
    # form goes one level back in the current url as opposed to
    # going back one level in browser history. This was resulting in a number
    # of hits to this action (was unimplemented and isn't supposed to be
    # implemented).
    redirect_to root_path
  end

  def show
    @person = api_get "people/#{params[:id]}"
    render layout: 'application' unless @person.nil?
  end

  def edit
    @person = api_get "people/#{params[:id]}"
    render layout: 'form' unless @person.nil?
  end

  def update
    @person = api_put "people/#{params[:id]}", {
      "firstname": params[:firstname],
      "lastname": params[:lastname],
      "birthdate": params[:birthdate],
      "gender": params[:gender]
    }
    redirect_to "/people/#{@person['id']}" unless @person.nil?
  end
end