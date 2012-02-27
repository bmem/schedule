module Bmem
  class ApplicationController < ActionController::Base
    helper Bmem::TitleHelper

    rescue_from CanCan::AccessDenied do |ex|
      redirect_back :alert => ex.message
    end


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

    def redirect_back(*args)
      target = root_url
      if request.env["HTTP_REFERER"].try {|s| s.start_with? root_url}
        # user came from our site
        target = :back
      end
      redirect_to target, *args
    end
  end
end
