require 'json'

class PatientsController < ApplicationController


    def index


      @patients = PATIENTS_JSON


    end

    def dashboard
    end

    PATIENTS_JSON = [
  {
      "id": 0,
      "person_id": 1,
      "deleted_at": nil,
      "created_at": "2018-06-26T08:26:00.000Z",
      "updated_at": "2018-06-26T08:26:00.000Z"
  },
  {
      "id": 1,
      "person_id": 0,
      "deleted_at": nil,
      "created_at": "2018-06-26T08:26:00.000Z",
      "updated_at": "2018-06-26T08:26:00.000Z"
  },
  {
      "id": 2,
      "person_id": 2,
      "deleted_at": nil,
      "created_at": "2018-06-26T08:26:00.000Z",
      "updated_at": "2018-06-26T08:26:00.000Z"
  }
]

end
