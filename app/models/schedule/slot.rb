module Schedule
  class Slot < ActiveRecord::Base
    belongs_to :shift
    belongs_to :position
    has_and_belongs_to_many :people
  end
end
