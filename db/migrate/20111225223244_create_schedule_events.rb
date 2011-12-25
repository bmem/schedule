class CreateScheduleEvents < ActiveRecord::Migration
  def change
    create_table :schedule_events do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :signup_open

      t.timestamps
    end
  end
end
