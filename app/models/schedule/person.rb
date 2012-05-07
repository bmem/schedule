module Schedule
  class Person < ActiveRecord::Base
    has_and_belongs_to_many :positions,
      :join_table => :schedule_people_positions
    has_and_belongs_to_many :slots, :join_table => :schedule_people_slots
    has_many :work_logs

    validates :name, :presence => true
  end
end
