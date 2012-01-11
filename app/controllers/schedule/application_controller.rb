module Schedule
  class ApplicationController < Bmem::ApplicationController
    load_and_authorize_resource
    load_and_authorize_resource :event, :class => Schedule::Event
  end
end
