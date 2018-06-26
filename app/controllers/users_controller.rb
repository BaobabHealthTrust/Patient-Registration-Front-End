class UsersController < ApplicationController
  def index
    # TODO: Retrieve list of users from API
    @users = SAMPLE_USERS
  end

  def show
    @user = SAMPLE_USERS[params[:id].to_i]
    # TODO: Route edit request to API
  end

  def edit
    @user = SAMPLE_USERS[params[:id].to_i]
    # TODO: Route edit request to API
  end

  def update
  end

  def destroy
    # TODO: Send delete request to API
  end

  private

  SAMPLE_USERS = [
    {
      "id": 0,
      "username": "foobar",
      "active": true,
      "person_id": 0,
      "deleted_at": nil,
      "created_at": "2018-06-26T07:43:27.000Z",
      "updated_at": "2018-06-26T07:43:27.000Z",
      "uuid": nil,
      "role_id": 1,
      "role": {
        "id": 1,
        "rolename": "manager",
        "deleted_at": nil,
        "created_at": "2018-06-26T07:43:27.000Z",
        "updated_at": "2018-06-26T07:43:27.000Z",
        "privileges": [],
      },
      "person": {
        "id": 0,
        "birthdate": "2000-01-01",
        "gender": "male",
        "deleted_at": nil,
        "created_at": "2018-06-26T07:43:27.000Z",
        "updated_at": "2018-06-26T07:43:27.000Z",
        "person_name": {
          "firstname": "foobar",
          "lastname": "random",
        },
        "personal_attributes": [
          {
            "id": 0,
            "value": "121321414132",
            "person_id": 0,
            "personal_attribute_type_id": 0,
            "deleted_at": nil,
            "created_at": "2018-06-26T07:43:27.000Z",
            "updated_at": "2018-06-26T07:43:27.000Z",
            "personal_attribute_type": {
              "id": 0,
              "name": "address",
              "created_at": "2018-06-26T07:43:27.000Z",
              "updated_at": "2018-06-26T07:43:27.000Z",
              "deleted_at": nil,
            },
          },
        ],
      },
    },
    {
      "id": 1,
      "username": "barfoo",
      "active": true,
      "person_id": 1,
      "deleted_at": nil,
      "created_at": "2018-06-26T07:43:27.000Z",
      "updated_at": "2018-06-26T07:43:27.000Z",
      "uuid": nil,
      "role_id": 0,
      "role": {
        "id": 0,
        "rolename": "clerk",
        "deleted_at": nil,
        "created_at": "2018-06-26T07:43:27.000Z",
        "updated_at": "2018-06-26T07:43:27.000Z",
        "privileges": [],
      },
      "person": {
        "id": 1,
        "birthdate": "2000-01-01",
        "gender": "male",
        "deleted_at": nil,
        "created_at": "2018-06-26T07:43:27.000Z",
        "updated_at": "2018-06-26T07:43:27.000Z",
        "person_name": {
          "firstname": "random",
          "lastname": "foobar",
        },
        "personal_attributes": [
          {
            "id": 1,
            "value": "foobar@foobar.com",
            "person_id": 1,
            "personal_attribute_type_id": 1,
            "deleted_at": nil,
            "created_at": "2018-06-26T07:43:27.000Z",
            "updated_at": "2018-06-26T07:43:27.000Z",
            "personal_attribute_type": {
              "id": 1,
              "name": "email",
              "created_at": "2018-06-26T07:43:27.000Z",
              "updated_at": "2018-06-26T07:43:27.000Z",
              "deleted_at": nil,
            },
          },
        ],
      },
    },
    {
      "id": 2,
      "username": "jrhacker",
      "active": true,
      "person_id": 3,
      "deleted_at": nil,
      "created_at": "2018-06-26T07:43:27.000Z",
      "updated_at": "2018-06-26T07:43:27.000Z",
      "uuid": nil,
      "role_id": 0,
      "role": {
        "id": 0,
        "rolename": "clerk",
        "deleted_at": nil,
        "created_at": "2018-06-26T07:43:27.000Z",
        "updated_at": "2018-06-26T07:43:27.000Z",
        "privileges": [],
      },
      "person": {
        "id": 3,
        "birthdate": "1990-01-01",
        "gender": "male",
        "deleted_at": nil,
        "created_at": "2018-06-26T07:43:27.000Z",
        "updated_at": "2018-06-26T07:43:27.000Z",
        "person_name": {
          "id": 3,
          "firstname": "Random",
          "lastname": "Geek",
          "person_id": 3,
          "deleted_at": nil,
          "created_at": "2018-06-26T07:43:27.000Z",
          "updated_at": "2018-06-26T07:43:27.000Z",
        },
        "personal_attributes": [],
      },
    },
  ]
end
