module Bmem
  class Controller < ActionController::Base
    def method_missing(sym, *args)
      return super if sym.to_s.start_with? 'default_'
      with_default = "default_#{sym}".to_sym
      if self.respond_to?(with_default)
        send with_default, *args
      else
        super
      end
    end

    protected
    # The user executing the current request, or nil if no user is logged in.
    # The main app is expected to override this method
    def default_current_user
      nil
    end
  end
end
