module Schedule
  class Event < ActiveRecord::Base
    has_many :shifts

    validates :name, :start_date, :end_date, :presence => true
    validates_with DateOrderValidator
  end
end
