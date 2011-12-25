module Schedule
  class Shift < ActiveRecord::Base
    belongs_to :event
  end
end
