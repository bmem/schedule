module Bmem
  module ApplicationHelper
    # Makes main_app.foo_path and engine.bar_path available to views as
    # main_app_routes.foo_path and engine_routes.bar_path
    def method_missing(meth)
      meth_name = meth.to_s
      if meth_name =~ /_routes$/
        meth = meth_name.sub(/_routes$/, '').to_sym
        return send(meth) if respond_to? meth
      end
      super
    end
  end
end
