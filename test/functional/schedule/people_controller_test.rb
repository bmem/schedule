require 'test_helper'

# NOTE: This test doesn't exercise create/update/delete since schedule_people
# is a view on dummy app's people table.
module Schedule
  class PeopleControllerTest < ActionController::TestCase
    setup do
      @routes = Schedule::Engine.routes
      @person = people(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:people)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should show person" do
      get :show, :id => @person
      assert_response :success
    end

    test "should get edit" do
      get :edit, :id => @person
      assert_response :success
    end
  end
end
