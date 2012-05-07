module Schedule
  class WorkLog < ActiveRecord::Base
    belongs_to :person
    belongs_to :position
    belongs_to :event
    belongs_to :shift

    validates_presence_of :person, :position, :start_time
  end
end
