module Bmem
  class Controller < ActionController::Base
    # The user executing the current request, or nil if no user is logged in.
    # The main app is expected to override this method
    def current_user
      nil
    end
  end
end
