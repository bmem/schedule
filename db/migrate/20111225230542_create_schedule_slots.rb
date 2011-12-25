class CreateScheduleSlots < ActiveRecord::Migration
  def change
    create_table :schedule_slots do |t|
      t.references :shift
      t.references :position
      t.integer :min_people, :default => 0
      t.integer :max_people, :default => 0

      t.timestamps
    end
    add_index :schedule_slots, :shift_id
    add_index :schedule_slots, :position_id

    create_table :schedule_people_slots, :id => false do |t|
      t.references :person
      t.references :slot
    end
    add_index :schedule_people_slots, [:person_id, :slot_id], :unique => true
    add_index :schedule_people_slots, :slot_id
  end
end
