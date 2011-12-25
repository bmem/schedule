module Schedule
  class Event < ActiveRecord::Base
    has_many :shifts
  end
end
