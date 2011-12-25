module Schedule
  class Person < ActiveRecord::Base
    has_and_belongs_to_many :positions
    has_and_belongs_to_many :slots
  end
end
