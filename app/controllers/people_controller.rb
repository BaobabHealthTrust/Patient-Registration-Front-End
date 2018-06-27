class PeopleController < ApplicationController
  def people
   
  end

  def index
    @pe = PATIENTS_JSON
  end

  PATIENTS_JSON = [
    {
        "id": 0,
        "person_id": 1,
        "deleted_at": nil,
        "created_at": "2018-06-26T08:26:00.000Z",
        "updated_at": "2018-06-26T08:26:00.000Z"
    },
   
  ]
  
end
