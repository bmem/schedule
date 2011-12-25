class CreateScheduleShifts < ActiveRecord::Migration
  def change
    create_table :schedule_shifts do |t|
      t.string :name
      t.text :description
      t.references :event
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
    add_index :schedule_shifts, :event_id
  end
end
