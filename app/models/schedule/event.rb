module Schedule
  class Event < ActiveRecord::Base
    has_many :shifts

    validates :name, :start_date, :end_date, :presence => true
    validates_with DateOrderValidator
    validates_with ReasonableDateValidator,
      :attributes => [:start_date, :end_date]
  end
end
