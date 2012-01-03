module Schedule
  class Shift < ActiveRecord::Base
    belongs_to :event
    has_many :slots

    validates :name, :start_time, :end_time, :event, :presence => true
    validates_with DateOrderValidator, :start => :start_time, :end => :end_time
    validates_with ReasonableDateValidator,
      :attributes => [:start_time, :end_time]
    # TODO validate start/end overlap with event's start/end?
  end
end
