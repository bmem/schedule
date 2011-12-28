module Schedule
  class Position < ActiveRecord::Base
    has_and_belongs_to_many :people, :join_table => :schedule_people_positions

    validates :name, :presence => true
  end
end
