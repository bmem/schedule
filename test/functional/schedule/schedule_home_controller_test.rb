require 'test_helper'

module Schedule
  class ScheduleHomeControllerTest < ActionController::TestCase
    setup do
      @routes = Schedule::Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_equal 1, assigns(:current_events).size
      assert_equal 1, assigns(:completed_events).size
      assert_equal 0, assigns(:upcoming_events).size
    end
  end
end
