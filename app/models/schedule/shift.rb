module Schedule
  class Shift < ActiveRecord::Base
    belongs_to :event
    has_many :slots

    validates :name, :start_time, :end_time, :presence => true
    validates_with DateOrderValidator, :start => :start_time, :end => :end_time
  end
end
