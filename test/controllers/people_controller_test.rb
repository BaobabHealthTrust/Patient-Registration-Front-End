require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get people" do
    get people_people_url
    assert_response :success
  end

end
