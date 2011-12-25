class CreateSchedulePeople < ActiveRecord::Migration
  def change
    create_table :schedule_people do |t|
      t.string :name

      t.timestamps
    end
  end
end
