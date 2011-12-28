module Schedule
  class Slot < ActiveRecord::Base
    belongs_to :shift
    belongs_to :position
    has_and_belongs_to_many :people, :join_table => :schedule_people_slots

    validates :shift_id, :position_id, :presence => true
    validates :min_people, :max_people, :presence => true,
      :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  end
end
