module Schedule
  class Shift < ActiveRecord::Base
    belongs_to :event
    has_many :slots
  end
end
